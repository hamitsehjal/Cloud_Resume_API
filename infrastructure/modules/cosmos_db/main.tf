# CosmosDB Account
resource "azurerm_cosmosdb_account" "db" {
  name                = var.cosmosdb_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  free_tier_enabled = true

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  consistency_policy {
    consistency_level = "Eventual"

  }

  capabilities {
    name = "EnableServerless"
  }
}

# SQL Database
resource "azurerm_cosmosdb_sql_database" "db" {
  name                = "resume-db"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
}

# SQl Container
resource "azurerm_cosmosdb_sql_container" "db" {
  name                  = "resume-container"
  resource_group_name   = azurerm_cosmosdb_account.db.resource_group_name
  account_name          = azurerm_cosmosdb_account.db.name
  database_name         = azurerm_cosmosdb_sql_database.db.name
  partition_key_paths   = ["/id"]
  partition_key_version = 1

  indexing_policy {
    indexing_mode = "consistent"
    included_path {
      path = "/*"
    }
    excluded_path {
      path = "/\"_etag\"/?" # for overriding indexing system properties
    }
  }
}
