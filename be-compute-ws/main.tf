
terraform {
  cloud {
    organization = "vpc-peering"

    workspaces {
      name = "be-compute-ws"
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
  region = data.terraform_remote_state.be-vpc.outputs["aws-region"]
}
