variable "location" {
  description = "Location of Service App"
  type        = string
}


variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "function_app_name" {
  description = "Name of the Function App"
  type        = string

}

variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "storage_account_access_key" {
  description = "Value of the Storage Account Access Key"
  type        = string
}
variable "storage_connection_string" {
  description = "Value of Storage Connection String"
  type        = string
}

variable "cosmosdb_connection_string" {
  description = "Value of CosmosDB Connection String"
  type        = string
}
