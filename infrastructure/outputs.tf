# Output from Azure Functions module
output "function_app_name" {
  value       = module.function.function_app_name
  description = "Name of the Azure Function App"
}

output "function_app_url" {
  value       = module.function.function_app_url
  description = "The URL of the Azure Function App"
}

# Output from Storage Module
output "storage_account_name" {
  value = module.storage.name
}

# # Output from CosmosDB module
# output "cosmos_db_name" {
#   value       = module.cosmos_db.account_name
#   description = "The name of CosmosDB Account"
# }
#
# output "cosmos_db_connection_string" {
#   value       = module.cosmos_db.connection_string
#   description = "The SQL connection string used to connect to CosmosDB Account"
#   sensitive   = true
# }

# output "cosmos_db_account_name" {
#   value       = module.cosmos_db.account_name
#   description = "The name of CosmosDB Account"
# }
#
# output "cosmos_db_database_name" {
#   value       = module.cosmos_db.database_name
#   description = "Name of CosmosDB SQL Database"
# }
#
# output "cosmos_db_container_name" {
#   value       = module.cosmos_db.container_name
#   description = "Name of CosmosDB Database Container"
# }
#
