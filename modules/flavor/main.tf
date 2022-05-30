# Define required providers
terraform {
  required_version = ">= 0.14.0"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.47.0"
    }
  }
}

resource "openstack_compute_flavor_v2" "m1_medium" {
  name      = "m1.medium"
  vcpus     = "2"
  ram       = "4096"
  disk      = "40"
}