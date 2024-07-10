variable "owner" {
  description = "resource owner"
  type        = string
  default     = "dynamic"
}
variable "environment" {
  description = "resource environment"
  type        = string
  default     = "vms"
}
variable "public_ip" {
  description = "virtual machine public ip"
  type        = string
  default     = "public-ip"
}
variable "usernames" {
  description = "keayvault name"
  type        = list(string)
  default     = (["rasheed", "onas", "moji"])
}
variable "vm_network_security_rule_name" {
  description = "vm network security group rule"
  type        = string
  default     = "vm-nsg-rule"
}