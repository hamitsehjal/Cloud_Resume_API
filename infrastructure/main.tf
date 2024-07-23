# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.12.0"
    }
  }
}

# configuring the Microsoft Azure Provider 
provider "azurerm" {
  features {}
}

# configuring the Time Provider
provider "time" {

}

# Resource Group 
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Time Delay
resource "time_sleep" "wait_30_seconds" {
  depends_on = [azurerm_resource_group.rg]
  create_duration = "30s"
}

# CosmosDB Module
module "cosmos_db" {
  depends_on = [time_sleep.wait_30_seconds]
  source                = "./modules/cosmos_db"
  cosmosdb_account_name = "${var.project_name}-cosmosdb"
  location              = var.location
  resource_group_name   = var.resource_group_name
}


# Storage Module
module "storage" {
  depends_on = [time_sleep.wait_30_seconds]
  source              = "./modules/storage_account"
  account_name        = "${var.project_name}26hamit"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Azure Function Module 
module "function" {
  depends_on = [module.cosmos_db, module.storage]
  source                     = "./modules/azure_functions"
  cosmosdb_connection_string = module.cosmos_db.connection_string
  function_app_name          = var.project_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  storage_account_access_key = module.storage.access_key
  storage_account_name       = module.storage.name
}