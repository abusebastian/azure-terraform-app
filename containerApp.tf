data "azurerm_resource_group" "rgrp" {
  name = var.resourceGroup
}
 
data "azurerm_container_registry" "acr" {
  name                = var.myContainerRegistry
  resource_group_name = data.azurerm_resource_group.rgrp.name
}

data "azurerm_container_app_environment" "mycontainerappenv" {
  name                = var.myContainerAppEnv
  resource_group_name = data.azurerm_resource_group.rgrp.name
}

data "azurerm_user_assigned_identity" "containerapp"{
  name                = var.managedIdentityAcr
  resource_group_name = data.azurerm_resource_group.rgrp.name
}

resource "azurerm_container_app" "mycontainerapp" {
  name                = var.myContainerApp 
  resource_group_name = data.azurerm_resource_group.rgrp.name 
  container_app_environment_id = data.azurerm_container_app_environment.mycontainerappenv.id 
  revision_mode = "Single" 

  template {          
    container {
      name    = var.myContainerApp  
      image   = "${data.azurerm_container_registry.acr.login_server}/exodusacr/reactspringapp:${var.imageTag}" 
      cpu     = 0.25
      memory  = "0.5Gi" 

      env {
        name  = "ENVIRONMENT"
        value = "production"
      }

      env {
        name  = "PORT"
        value = "8080"
      }

      # liveness_probe {
      #   port = 8080
      #   transport = "HTTP"
      # }
      
      # readiness_probe {
      #   port = 8080
      #   transport = "HTTP"
      # }
    }

    max_replicas = 2
    min_replicas = 0

    http_scale_rule {
      name="scalerule"
      concurrent_requests = "10"
    }
  }

  ingress {
    external_enabled = true
    target_port      = 8080

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  registry {
    server   = data.azurerm_container_registry.acr.login_server
    identity = data.azurerm_user_assigned_identity.containerapp.id
  }

  identity {
    type = "SystemAssigned, UserAssigned"
    identity_ids = [data.azurerm_user_assigned_identity.containerapp.id]
  }
}
