output "name" {
  value       = azurerm_storage_account.storage_account.name
  description = "Name of Storage Account"
}

output "access_key" {
  value       = azurerm_storage_account.storage_account.primary_access_key
  description = "Primary Access Key of Storage Account"
  sensitive   = true
}

output "connection_string" {
  value       = azurerm_storage_account.storage_account.primary_connection_string
  description = "Primary Connection String of Storage Account"
  sensitive   = true
}