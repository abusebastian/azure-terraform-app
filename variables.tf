variable "location" {
    type = string
    default = "Location"
}

variable "resourceGroup" {
    type = string
    description = "Resource Group"
}

variable "managedIdentityAcr" {
    type = string
    description = "MI used for ACR"
}

variable "myContainerRegistry" {
    type = string
    description = "Name of Container Registry"
}

variable "myContainerApp" {
    type = string
    description = "Name of Container App"
}

variable "myContainerAppEnv" {
    type = string
    description = "Name of Conatiner App Environment"
}

variable "myLogAnalytics" {
    type = string
    description = "Name of Log Analytics"
}

variable "imageTag" {
    type = string
    description = "Tag of last build image"
}