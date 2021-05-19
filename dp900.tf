/*
  create environment for dp900 exam prep

*/
// create learning resource goup
resource "azurerm_resource_group" "DP900_mossRC" {
  name     = "mossy-example-resources"
  location = "eastus"
}    
    
//  create storage account

resource "azurerm_storage_account" "DP900_moss" {
  name                     = "dp900storageaccount"
  resource_group_name      = azurerm_resource_group.DP900_mossRC.name
  location                 = azurerm_resource_group.DP900_mossRC.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "DP900_moss" {
  name               = "example"
  storage_account_id = azurerm_storage_account.DP900_moss.id

  properties = {
    hello = "aGVsbG8="
  }
}    
    
// create synapse workspace
resource "azurerm_synapse_workspace" "DP900_mosstraining" {
  name                                 = "Moss-training"
  resource_group_name                  = azurerm_resource_group.DP900_mossRC.name
  location                             = azurerm_resource_group.DP900_mossRC.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.DP900_moss.id
  sql_administrator_login              = "sqladminuser"
  sql_administrator_login_password     = "H@Sh1CoR3!"

  aad_admin {
    login     = "AzureAD Admin"
    object_id = "00000000-0000-0000-0000-000000000000"
    tenant_id = "00000000-0000-0000-0000-000000000000"
  }

  tags = {
    Env = "learning"
  }
}    
    
//  next create????
    
    
// create power BI capability
    
