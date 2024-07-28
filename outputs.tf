output "ingress" {
  value = azurerm_container_registry.acr.name
  values= azurerm_container_app.mycontainerapp.
}


output "container_app_ingress" {
  value = {
    external_enabled = azurerm_container_app.mycontainerapp.ingress.external_enabled
    target_port      = azurerm_container_app.mycontainerapp.ingress.target_port
    traffic_weight   = azurerm_container_app.mycontainerapp.ingress.traffic_weight
  }
}