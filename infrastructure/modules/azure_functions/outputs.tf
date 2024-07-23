output "function_app_name" {
  value       = azurerm_linux_function_app.function_app.name
  description = "Name of the Function App"
}
output "function_app_url" {
  value       = azurerm_linux_function_app.function_app.default_hostname
  description = "The URL of the Azure Function App"
}