
terraform {
  cloud {
    organization = "vcs-wf-org"

    workspaces {
      name = "be-security-ws"
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
  region = data.terraform_remote_state.vpc.outputs["aws-region"]
}
