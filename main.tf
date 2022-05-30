# Define required providers
terraform {
  required_version = ">= 0.14.0"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.47.0"
    }
  }

  backend "swift" {
    container         = "terraform-state"
    archive_container = "terraform-state-archive"
  }
}

# Configure the OpenStack Provider
provider "openstack" {

}

module "flavor" {
  source = "./modules/flavor"
}

module "image" {
  source = "./modules/image"
}

module "project" {
  source = "./modules/project"
}
