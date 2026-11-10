resource "aws_vpc_security_group_ingress_rule" "fe-private-sgp-02-inbound-allow-icmp-from-be-private-sgp-02" {
  description       = "Allow Ping / ICMP Echo Request (Type 8) from be-private-sgp-02"
  security_group_id = data.terraform_remote_state.fe-security.outputs[fe-private-sgp-02][0].id
  cidr_ipv4         = data.terraform_remote_state.be-vpc.outputs["be-vpc-cidr-block"] 
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
}
resource "aws_vpc_security_group_ingress_rule" "fe-private-sgp-02-inbound-allow-ssh-from-be-private-sgp-02" {
  description       = "Allow SSH from be-private-sgp-02"
  security_group_id = data.terraform_remote_state.fe-security.outputs[fe-private-sgp-02][0].id
  cidr_ipv4         = data.terraform_remote_state.be-vpc.outputs["be-vpc-cidr-block"] 
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}
resource "aws_vpc_security_group_egress_rule" "fe-private-02-outbound-allow-icmp-to-be-private-sgp-02" {
  description       = "Allow icmp to be-private-sgp-02"
  security_group_id = data.terraform_remote_state.fe-security.outputs[fe-private-sgp-02][0].id
  referenced_security_group_id = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  ip_protocol = "icmp"
  from_port   = 8
  to_port     = 0
}
resource "aws_vpc_security_group_egress_rule" "fe-private-02-outbound-allow-ssh-to-be-private-sgp-02" {
  security_group_id = data.terraform_remote_state.fe-security.outputs[fe-private-sgp-02][0].id
  referenced_security_group_id = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
}

#############################################################################################
# resource "aws_vpc_security_group_ingress_rule" "fe-private-sgp-03-inbound-allow-icmp-from-fe-private-sgp-01" {
#   description       = "Allow Ping / ICMP Echo Request (Type 8) from fe-private-sgp-01"
#   security_group_id = aws_security_group.fe-private-sgp-03.id
#   referenced_security_group_id = aws_security_group.fe-private-sgp-01.id
#   ip_protocol       = "icmp"
#   from_port         = 8
#   to_port           = 0
# }
# resource "aws_vpc_security_group_ingress_rule" "fe-private-sgp-03-inbound-allow-ssh-from-fe-private-sgp-01" {
#   description       = "Allow SSH from fe-private-sgp-01"
#   security_group_id = aws_security_group.fe-private-sgp-03.id
#   referenced_security_group_id = aws_security_group.fe-private-sgp-01.iid
#   ip_protocol       = "tcp"
#   from_port         = 22
#   to_port           = 22
# }

resource "aws_vpc_security_group_egress_rule" "fe-private-03-outbound-allow-icmp-to-be-private-sgp-03" {
  description       = "Allow icmp to be-private-sgp-03"
  security_group_id = aws_security_group.fe-private-sgp-03.id
  # referenced_security_group_id = aws_security_group.be_private_sg02.id // allow Source
  # referenced_security_group_id = data.terraform_remote_state.backend_security.outputs.be_private_sg02_id
  cidr_ipv4   = "0.0.0.0/24"
  ip_protocol = "icmp"
  from_port   = 8
  to_port     = 0

}

resource "aws_vpc_security_group_egress_rule" "fe-private-03-outbound-allow-ssh-to-be-private-sgp-03" {
  security_group_id = aws_security_group.fe-private-sgp-03.id
  # referenced_security_group_id = aws_security_group.be_private_sg02.id // allow Source
  # referenced_security_group_id = data.terraform_remote_state.backend_security.outputs.be_private_sg02_id
  cidr_ipv4   = "0.0.0.0/24"
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
}