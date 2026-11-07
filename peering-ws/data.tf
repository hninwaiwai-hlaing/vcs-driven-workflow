data "terraform_remote_state" "fe-network" {
  backend = "remote"

  config = {
    organization = "vcs-wf-org"
    workspaces = {
      name = "fe-network-ws"
    }
  }
}

data "terraform_remote_state" "be-network" {
  backend = "remote"

  config = {
    organization = "vcs-wf-org"
    workspaces = {
      name = "be-network-ws"
    }
  }
}