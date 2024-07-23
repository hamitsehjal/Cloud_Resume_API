variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "resumeapi-rg-hamit"
}

variable "location" {
  description = "Azure Region to deploy resources"
  type        = string
  default     = "Central US"
}

variable "project_name" {
  description = "Name of Project"
  type        = string
  default     = "resumeapi"
}
