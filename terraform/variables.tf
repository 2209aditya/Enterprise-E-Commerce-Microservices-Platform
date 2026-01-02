variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "environment" {
  type    = string
  default = "prod"
}

variable "project_name" {
  type    = string
  default = "ecommerce"
}

variable "aks_node_count" {
  type    = number
  default = 3
}
