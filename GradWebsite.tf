/*
  Graduation WebSite for Leah and Connor
    
*/
  
// DNS name?
    
    
//  create storage account
resource "azurerm_storage_account" "static_storage" {
  name                     = "${local.env_prefix_no_separator}stor"
  resource_group_name      = azurerm_resource_group.MossyResourceGroup.name
  location                 = azurerm_resource_group.MossyResourceGroup.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  enable_https_traffic_only = true

  static_website {
    index_document = "index.html"
  }

  tags = {
    product = var.product
  }
    
    
//  create Webite gate way to storage accoutn
    
    
    
    
    

