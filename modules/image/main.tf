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

resource "openstack_images_image_v2" "fedoracoreos35" {
  name             = "Fedora-CoreOS-35"
  local_file_path = "PATH_TO_IMAGES/fedora-coreos-35.20220424.3.0-openstack.x86_64.qcow2"
  container_format = "bare"
  disk_format      = "qcow2"
}