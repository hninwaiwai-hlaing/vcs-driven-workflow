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
data "terraform_remote_state" "fe-security" {
  backend = "remote"

  config = {
    organization = "vcs-wf-org"
    workspaces = {
      name = "fe-security-ws"
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