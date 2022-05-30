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

resource "openstack_identity_project_v3" "project_1" {
  name = "project_1"
}

resource "openstack_identity_user_v3" "user_1" {
  name               = "user_1"
  default_project_id = "${openstack_identity_project_v3.project_1.id}"
  region      = "RegionOne"
}

resource "openstack_identity_group_v3" "group_1" {
  name        = "group_1"
  description = "group 1"
  region      = "RegionOne"
}

resource "openstack_identity_role_v3" "role_1" {
  name = "role_1"
  region      = "RegionOne"
}

resource "openstack_identity_user_membership_v3" "user_membership_1" {
  user_id  = "${openstack_identity_user_v3.user_1.id}"
  group_id = "${openstack_identity_group_v3.group_1.id}"
  region      = "RegionOne"
}

resource "openstack_identity_role_assignment_v3" "role_assignment_1" {
  group_id   = "${openstack_identity_group_v3.group_1.id}"
  project_id = "${openstack_identity_project_v3.project_1.id}"
  role_id    = "${openstack_identity_role_v3.role_1.id}"
  region      = "RegionOne"
}