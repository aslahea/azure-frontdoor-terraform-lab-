resource_group_name = "rg-frontdoor-lab"
location            = "centralindia"
tags = {
  Environment = "dev"
  Project     = "frontdoor-lab"
  ManagedBy   = "Terraform"
  owner       = "Aslah"
}

app_service_plan_name = "asp-frontdoor-lab"
web_app_name          = "frontdoor-webapp-aslahea"

frontdoor_profile_name  = "fd-profile-lab"
frontdoor_endpoint_name = "fd-endpoint-aslahea"

