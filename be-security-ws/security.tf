resource "aws_security_group" "be-public-sgp-01" {
  name        = "be-public-sgp-01"
  description = "Security Group for frontend public instance 01"
  vpc_id      = data.terraform_remote_state.be-vpc.outputs["be-vpc-id"]

  tags = {
    Name = "be-public-sgp-01"
  }
}
resource "aws_vpc_security_group_ingress_rule" "be-public-sgp-01-inbound-allow-icmp" {
  security_group_id = aws_security_group.be-public-sgp-01.id
  description       = "Allow Ping / ICMP Echo Request (Type 8) from anywhere"
  ip_protocol       = "icmp"
  from_port         = 8
  to_port           = 0
  cidr_ipv4         = "0.0.0.0/0"
}
resource "aws_vpc_security_group_ingress_rule" "be-public-sgp-01-inbound-allow-ssh" {
  security_group_id = aws_security_group.be-public-sgp-01.id
  description       = "Allow SSH (Port 22) from anywhere"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0"
}
resource "aws_vpc_security_group_egress_rule" "be-public-sgp-01-outbound-allow-all" {
  security_group_id = aws_security_group.be-public-sgp-01.id
  description       = "Allow all outbound traffic"
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

#############################################################################################
resource "aws_security_group" "be-private-sgp-01" {
  name        = "be-private-sgp-01"
  description = "Security Group for frontend private instance 01"
  vpc_id      = data.terraform_remote_state.be-vpc.outputs["be-vpc-id"]

  tags = {
    Name = "be-private-sgp-01"
  }
}
resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-01-inbound-allow-icmp" {
  description                  = "Allow Ping / ICMP Echo Request (Type 8) from be-public-sgp-01"
  security_group_id            = aws_security_group.be-private-sgp-01.id
  referenced_security_group_id = aws_security_group.be-public-sgp-01.id
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0

}
resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-01-inbound-allow-ssh" {
  description                  = "Allow SSH from be-public-sgp-01"
  security_group_id            = aws_security_group.be-private-sgp-01.id
  referenced_security_group_id = aws_security_group.be-public-sgp-01.id
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22

}
resource "aws_vpc_security_group_egress_rule" "be-private-sgp-01-outbound-allow-all" {
  description       = "Allow all outbound traffic"
  security_group_id = aws_security_group.be-private-sgp-01.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

#############################################################################################
resource "aws_security_group" "be-private-sgp-02" {
  name        = "be-private-sgp-02"
  description = "Security Group for frontend private instance 02"
  vpc_id      = data.terraform_remote_state.be-vpc.outputs["be-vpc-id"]

  tags = {
    Name = "be-private-sgp-02"
  }
}
resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-02-inbound-allow-icmp-from-be-private-sgp-01" {
  description                  = "Allow Ping / ICMP Echo Request (Type 8) from be-private-sgp-01"
  security_group_id            = aws_security_group.be-private-sgp-02.id
  referenced_security_group_id = aws_security_group.be-private-sgp-01.id
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
}
resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-02-inbound-allow-ssh-from-be-private-sgp-01" {
  description                  = "Allow SSH from be-private-sgp-01"
  security_group_id            = aws_security_group.be-private-sgp-02.id
  referenced_security_group_id = aws_security_group.be-private-sgp-01.id
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
}
# TODO : for backend
# resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-02-inbound-allow-icmp-from-be-private-sgp-01" {
#   security_group_id = aws_security_group.be-private-sgp-02.id
#   referenced_security_group_id = aws_security_group.be-private-sgp-01.id
#   description       = "Allow Ping / ICMP Echo Request (Type 8) from be-private-sgp-01"
#   from_port         = 22
#   to_port           = 22
#   ip_protocol       = "tcp"
# }
# resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-02-inbound-allow-ssh-from-be-private-sgp-01" {
#   security_group_id = aws_security_group.be-private-sgp-02.id
#   referenced_security_group_id = aws_security_group.be-private-sgp-01.iid
#   description       = "Allow SSH from be-private-sgp-01"
#   from_port         = 22
#   to_port           = 22
#   ip_protocol       = "tcp"
# }
resource "aws_vpc_security_group_egress_rule" "be-private-02-outbound-allow-icmp-to-be-private-sgp-02" {
  description       = "Allow icmp to be-private-sgp-02"
  security_group_id = aws_security_group.be-private-sgp-02.id
  # referenced_security_group_id = aws_security_group.be_private_sg02.id // allow Source
  # referenced_security_group_id = data.terraform_remote_state.backend_security.outputs.be_private_sg02_id
  cidr_ipv4   = "0.0.0.0/24"
  ip_protocol = "icmp"
  from_port   = 8
  to_port     = 0

}

resource "aws_vpc_security_group_egress_rule" "be-private-02-outbound-allow-ssh-to-be-private-sgp-02" {
  security_group_id = aws_security_group.be-private-sgp-02.id
  # referenced_security_group_id = aws_security_group.be_private_sg02.id // allow Source
  # referenced_security_group_id = data.terraform_remote_state.backend_security.outputs.be_private_sg02_id
  cidr_ipv4   = "0.0.0.0/24"
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
}
#############################################################################################
resource "aws_security_group" "be-private-sgp-03" {
  name        = "be-private-sgp-03"
  description = "Security Group for private instance 03"
  vpc_id      = data.terraform_remote_state.be-vpc.outputs["be-vpc-id"]

  tags = {
    Name = "be-private-sgp-03"
  }
}

resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-03-inbound-allow-icmp-from-be-private-sgp-01" {
  description                  = "Allow Ping / ICMP Echo Request (Type 8) from be-private-sgp-01"
  security_group_id            = aws_security_group.be-private-sgp-03.id
  referenced_security_group_id = aws_security_group.be-private-sgp-01.id
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
}
resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-03-inbound-allow-ssh-from-be-private-sgp-01" {
  description                  = "Allow SSH from be-private-sgp-01"
  security_group_id            = aws_security_group.be-private-sgp-03.id
  referenced_security_group_id = aws_security_group.be-private-sgp-01.id
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
}
# TODO : for backend
# resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-03-inbound-allow-icmp-from-be-private-sgp-01" {
#   description       = "Allow Ping / ICMP Echo Request (Type 8) from be-private-sgp-01"
#   security_group_id = aws_security_group.be-private-sgp-03.id
#   referenced_security_group_id = aws_security_group.be-private-sgp-01.id
#   ip_protocol       = "icmp"
#   from_port         = 8
#   to_port           = 0
# }
# resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-03-inbound-allow-ssh-from-be-private-sgp-01" {
#   description       = "Allow SSH from be-private-sgp-01"
#   security_group_id = aws_security_group.be-private-sgp-03.id
#   referenced_security_group_id = aws_security_group.be-private-sgp-01.iid
#   ip_protocol       = "tcp"
#   from_port         = 22
#   to_port           = 22
# }

resource "aws_vpc_security_group_egress_rule" "be-private-03-outbound-allow-icmp-to-be-private-sgp-03" {
  description       = "Allow icmp to be-private-sgp-03"
  security_group_id = aws_security_group.be-private-sgp-03.id
  # referenced_security_group_id = aws_security_group.be_private_sg02.id // allow Source
  # referenced_security_group_id = data.terraform_remote_state.backend_security.outputs.be_private_sg02_id
  cidr_ipv4   = "0.0.0.0/24"
  ip_protocol = "icmp"
  from_port   = 8
  to_port     = 0

}

resource "aws_vpc_security_group_egress_rule" "be-private-03-outbound-allow-ssh-to-be-private-sgp-03" {
  security_group_id = aws_security_group.be-private-sgp-03.id
  # referenced_security_group_id = aws_security_group.be_private_sg02.id // allow Source
  # referenced_security_group_id = data.terraform_remote_state.backend_security.outputs.be_private_sg02_id
  cidr_ipv4   = "0.0.0.0/24"
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
}