/*
  create environment for dp900 exam prep

*/
// create learning resource goup
resource "azurerm_resource_group" "dp900mossRC" {
  name     = "mossy-dp900"
  location = "eastus"
}    
    
//  create storage account

resource "azurerm_storage_account" "dp900moss" {
  name                     = "mossdp900storageaccount"
  resource_group_name      = azurerm_resource_group.dp900mossRC.name
  location                 = azurerm_resource_group.dp900mossRC.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "dp900moss" {
  name               = "example"
  storage_account_id = azurerm_storage_account.dp900moss.id

  properties = {
    hello = "aGVsbG8="
  }
}    
    
// create synapse workspace
resource "azurerm_synapse_workspace" "dp900mosstraining" {
  name                                 = "mossdp900training"
  resource_group_name                  = azurerm_resource_group.dp900mossRC.name
  location                             = azurerm_resource_group.dp900mossRC.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.dp900moss.id
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
    
