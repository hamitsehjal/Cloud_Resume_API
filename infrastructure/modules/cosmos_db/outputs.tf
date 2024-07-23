output "endpoint" {
  value       = azurerm_cosmosdb_account.db.endpoint
  description = "The Endpoint used to connect to CosmosDB Account "
}

output "connection_string" {
  value       = azurerm_cosmosdb_account.db.primary_sql_connection_string
  description = "The connection string used to connect to CosmosDB Account"
  sensitive   = true
}

output "account_name" {
  value       = azurerm_cosmosdb_account.db.name
  description = "The name of CosmosDB Account"
}

output "account_id" {
  value       = azurerm_cosmosdb_account.db.id
  description = "The ID of CosmosDB Account"
}


output "database_name" {
  value       = azurerm_cosmosdb_sql_database.db.name
  description = "Name of CosmosDB SQL Database"
}

output "container_name" {
  value       = azurerm_cosmosdb_sql_container.db.name
  description = "Name of CosmosDB SQL Database Container"
}