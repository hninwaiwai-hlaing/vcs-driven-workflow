data "terraform_remote_state" "be-vpc" {
  backend = "remote"

  config = {
    organization = "vcs-wf-org"
    workspaces = {
      name = "be-network-ws"
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

#############################################################
# Data Source: Get latest Amazon Linux 2023 AMI
#############################################################
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}