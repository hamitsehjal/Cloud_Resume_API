output "cosmos_db_endpoint" {
  value       = azurerm_cosmosdb_account.db.endpoint
  description = "The Endpoint used to connect to CosmosDB Account "
}

output "cosmos_db_connection_string" {
  value       = azurerm_cosmosdb_account.db.primary_sql_connection_string
  description = "The SQL connection string used to connect to CosmosDB Account"
}

output "cosmos_db_name" {
  value       = azurerm_cosmosdb_account.db.name
  description = "The name of CosmosDB Account"
}

output "cosmos_db_id" {
  value       = azurerm_cosmosdb_account.db.id
  description = "The ID of CosmosDB Account"
}
