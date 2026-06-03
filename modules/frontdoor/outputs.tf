output "frontdoor_endpoint" {
  value       = azurerm_cdn_frontdoor_endpoint.main.host_name
  description = "The host name of the Front Door endpoint"
}
