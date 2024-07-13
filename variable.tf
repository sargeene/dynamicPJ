variable "owner" {
  description = "resource owner"
  type        = string
  default     = "RayDy"
}
variable "location" {
  description = "resource owner"
  type        = string
  default     = "uksouth"
}
variable "environment" {
  description = "resource environment"
  type        = string
  default     = "vms"
}
variable "rg_name" {
  description = "resource group name"
  type        = string
  default     = "rg"
}
variable "public_ip" {
  description = "virtual machine public ip"
  type        = string
  default     = "public-ip"
}
variable "kv_name" {
  description = "keyvault username"
  type        = string
  default     = "dynamic-key-vault"
}
variable "usernames" {
  description = "keayvault username"
  type        = list(string)
  default     = ["rasheed"]
  # ["rasheed", "onas", "moji"]
}
variable "virtual_network" {
  description = "virtual network"
  type        = string
  default     = "vnet"
}
variable "vm_nsg" {
  description = "vm network security group"
  type        = string
  default     = "vm-nsg"
}
variable "vm_network_security_rule_name" {
  description = "vm network security group rule"
  type        = string
  default     = "vm-nsg-rule"
}

