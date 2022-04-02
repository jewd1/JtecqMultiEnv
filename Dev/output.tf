output "app_service_name" {
  value = azurerm_app_service.ap.name
}

output "app_service_default_hostname" {
  value = "https://${azurerm_app_service.ap.default_site_hostname}"
}