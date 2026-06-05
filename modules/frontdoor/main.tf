resource "azurerm_cdn_frontdoor_profile" "main" {
  name                = var.frontdoor_profile_name
  resource_group_name = var.resource_group_name
  sku_name            = "Standard_AzureFrontDoor"

  tags = var.tags
}

resource "azurerm_cdn_frontdoor_endpoint" "main" {
  name                     = var.frontdoor_endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.main.id

  tags = var.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "main" {
  name                     = "app-origin-group"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.main.id

  load_balancing {
    sample_size                 = 4
    successful_samples_required = 3
  }

  health_probe {
    interval_in_seconds = 100
    path                = "/"
    protocol            = "Https"
    request_type        = "GET"
  }
}

resource "azurerm_cdn_frontdoor_origin" "main" {
  name                          = "webapp-origin"
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.main.id

  enabled                        = true
  host_name                      = var.backend_address
  http_port                      = 80
  https_port                     = 443
  origin_host_header             = var.backend_address
  priority                       = 1
  weight                         = 1000
  certificate_name_check_enabled = true
}

resource "azurerm_cdn_frontdoor_route" "main" {
  name                          = "app-route"
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.main.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.main.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.main.id]

  patterns_to_match      = ["/*"]
  supported_protocols    = ["Http", "Https"]
  forwarding_protocol    = "HttpsOnly"
  https_redirect_enabled = true
  link_to_default_domain = true
  cdn_frontdoor_rule_set_ids = [
    azurerm_cdn_frontdoor_rule_set.main.id
  ]

  cache {
    query_string_caching_behavior = "IgnoreQueryString"
    compression_enabled           = true
    content_types_to_compress = [
      "text/html",
      "text/css",
      "application/javascript",
      "application/json"
    ]
  }
}

resource "azurerm_cdn_frontdoor_rule_set" "main" {
  name                     = "cacheruleset"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.main.id
}

resource "azurerm_cdn_frontdoor_rule" "cache_rule" {
  name                      = "cachestaticcontent" # Must contain only alphanumeric characters.
  cdn_frontdoor_rule_set_id = azurerm_cdn_frontdoor_rule_set.main.id
  order                     = 1

  conditions {
    request_uri_condition {
      operator         = "BeginsWith"
      match_values     = ["/"]
      negate_condition = false
    }
  }

  actions {
    route_configuration_override_action {
      cache_behavior      = "OverrideAlways"
      cache_duration      = "1.00:00:00"
      compression_enabled = true

      query_string_caching_behavior = "IgnoreQueryString"
    }
  }
}

