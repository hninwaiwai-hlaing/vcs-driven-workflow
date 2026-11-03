
terraform {
  cloud {
    organization = "vcs-wf-org"

    workspaces {
      name = "fe-security-ws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.69.1"
    }
  }
}

provider "aws" {
  region = data.terraform_remote_state.fe-vpc.outputs["aws-region"]
}
