data "terraform_remote_state" "be-vpc" {
  backend = "remote"

  config = {
    organization = "vcs-wf-org"
    workspaces = {
      name = "be-network-ws"
    }
  }
}
data "terraform_remote_state" "fe-vpc" {
  backend = "remote"

  config = {
    organization = "vcs-wf-org"
    workspaces = {
      name = "fe-network-ws"
    }
  }
}
data "terraform_remote_state" "fe-security" {
  backend = "remote"

  config = {
    organization = "vcs-wf-org"
    workspaces = {
      name = "fe-security-ws"
    }
  }
}
data "terraform_remote_state" "fe-be-vpc-peering" {
  backend = "remote"

  config = {
    organization = "vcs-wf-org"
    workspaces = {
      name = "peering-ws"
    }
  }
}