terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.88.0"
    }
  }
}



provider "azurerm" {
  # Configure Azure provider with your authentication details
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "terraform_resources" {
  name     = "terraform-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage_account_terr" {
  name                     = "terrabasecode"
  resource_group_name      = "terraform-resources"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account" "storage_account_blob" {
  name                     = "terrablobapp"
  resource_group_name      = "terraform-resources"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
