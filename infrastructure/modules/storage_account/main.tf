# Storage Account
resource "azurerm_storage_account" "storage_account" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = var.location
  name                     = var.account_name
  resource_group_name      = var.resource_group_name
}