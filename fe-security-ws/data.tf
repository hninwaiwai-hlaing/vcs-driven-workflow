data "terraform_remote_state" "fe-vpc" {
  backend = "remote"

  config = {
    organization = "vcs-wf-org"
    workspaces = {
      name = "fe-network-ws"
    }
  }
}

data "terraform_remote_state" "be-security" {
  backend = "remote"

  config = {
    organization = "vcs-wf-org"
    workspaces = {
      name = "be-security-ws"
    }
  }
}