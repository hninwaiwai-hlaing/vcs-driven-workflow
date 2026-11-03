data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "vpc-wf-org"
    workspaces = {
      name = "fe-network-ws"
    }
  }
}