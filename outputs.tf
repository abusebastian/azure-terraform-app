output "container_app_ingress" {
  value = {
    external_enabled = azurerm_container_app.mycontainerapp.ingress[0].external_enabled
    target_port      = azurerm_container_app.mycontainerapp.ingress[0].target_port
    traffic_weight   = azurerm_container_app.mycontainerapp.ingress[0].traffic_weight
    endpoint_url     = azurerm_container_app.mycontainerapp.fqdn
  }
}
