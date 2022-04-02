provider "azurerm" {
  subscription_id = "f317306a-f295-48c8-832f-aea65116293d"
  tenant_id       = "a62e6037-c793-4127-b8e2-d231d6a4eec9"
  features {}
}

resource "azurerm_resource_group" "tt" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_app_service_plan" "app" {
  name                = "${var.prefix}-asp"
  location            = azurerm_resource_group.tt.location
  resource_group_name = azurerm_resource_group.tt.name

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "ap" {
  name                = "${var.prefix}-appservice"
  location            = azurerm_resource_group.tt.location
  resource_group_name = azurerm_resource_group.tt.name
  app_service_plan_id = azurerm_app_service_plan.app.id

  site_config {
    dotnet_framework_version = "v4.0"
    remote_debugging_enabled = true
    remote_debugging_version = "VS2019"
  }
}