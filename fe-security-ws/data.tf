data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "vcs-wf-org"
    workspaces = {
      name = "fe-network-ws"
    }
  }
}