locals {
  owner       = var.owner
  environment = var.environment

  tags = {
    environment = "dynamic"
    project     = "vms"
  }
}