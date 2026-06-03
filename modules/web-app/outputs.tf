output "name" {
  description = "The name of the web app"
  value       = azurerm_windows_web_app.this.name
}

output "default_hostname" {
  description = "The default hostname of the web app"
  value       = azurerm_windows_web_app.this.default_hostname
}

output "id" {
  description = "The ID of the web app"
  value       = azurerm_windows_web_app.this.id
}
