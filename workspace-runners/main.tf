terraform {
  required_version = "~>1.16.0"

  cloud {
    organization = "vpc-wf-org"

    workspaces {
      name = "workspace-runner"
    }
  }

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.82.0"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
}