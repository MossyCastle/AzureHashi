/*
  Graduation WebSite for Leah and Connor
    
*/
  
// DNS name?
    
# Create a resource group
resource "azurerm_resource_group" "GradRG" {
  name     = "GradPartWebsite"
  location = "eastus"
}
    
    
//  create storage account
resource "azurerm_storage_account" "gradwebitestorage" {
  name                     = "gradwebsite"
  resource_group_name      = azurerm_resource_group.GradRG.name
  location                 = azurerm_resource_group.GradRG.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "ZRS"
  enable_https_traffic_only = true

  static_website {
    index_document = "index.html"
  }

  tags = {
    product = "GradParty"
  }
}    
    
//  create Webite gate way to storage accoutn
    
    
    
    
    

