# App Service Plan
resource "azurerm_service_plan" "service_plan" {
  location            = var.location
  name                = "${var.function_app_name}_plan"
  os_type             = "Linux"
  resource_group_name = var.resource_group_name
  sku_name            = "Y1"
}

# locals {
#   curr_timestamp = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
#   azure_function_name = "${var.function_app_name}-${local.curr_timestamp}"
# }
# Function App
resource "azurerm_linux_function_app" "function_app" {
  location                   = var.location
  name                       = "${var.function_app_name}func"
  resource_group_name        = var.resource_group_name
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  service_plan_id            = azurerm_service_plan.service_plan.id

  https_only = true

  app_settings = {
    "ENABLE_ORYX_BUILD"              = "true"
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"
    "FUNCTIONS_WORKER_RUNTIME"       = "python"
    "AzureWebJobsFeatureFlags"       = "EnableWorkerIndexing"
  }
  site_config {
    cors {
      allowed_origins = ["*"]
    }
    application_stack {
      python_version = "3.12"
    }
  }

  #   connection_string {
  #     name  = "CosmosDBConnectionString"
  #     type  = "Custom"
  #     value = var.cosmosdb_connection_string
  #   }


}

