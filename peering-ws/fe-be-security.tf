# ==============================================================================
# Cross-VPC Rules: pri-sgp-02 (hc-backend-vpc) <-> pri-sgp-02 (hc-frontend-vpc)
# ==============================================================================
resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-02-inbound-allow-icmp-from-fe-private-sgp-02" {
  description                  = "Allow Only FROM pri-sgp-02(hc-frontend-vpc) to ping private-instance-02"
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-02-id"]
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
  depends_on                   = [aws_vpc_peering_connection.fe-be-vpc-peering]
}

resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-02-inbound-allow-ssh-from-fe-private-sgp-02" {
  description                  = "Allow Only FROM pri-sgp-02(hc-frontend-vpc) to SSH to private-instance-02"
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-02-id"]
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  depends_on                   = [aws_vpc_peering_connection.fe-be-vpc-peering]
}

resource "aws_vpc_security_group_egress_rule" "be-private-02-outbound-allow-icmp-to-fe-private-sgp-02" {
  description                  = "Allow Only to ping private-instance-02 (hc-frontend-vpc)"
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-02-id"]
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
  depends_on                   = [aws_vpc_peering_connection.fe-be-vpc-peering]
}

resource "aws_vpc_security_group_egress_rule" "be-private-02-outbound-allow-ssh-to-fe-private-sgp-02" {
  description                  = "Allow Only to SSH to private-instance-02 (hc-frontend-vpc)"
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-02-id"]
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  depends_on                   = [aws_vpc_peering_connection.fe-be-vpc-peering]
}

# ==============================================================================
# Cross-VPC Rules: pri-sgp-03 (hc-backend-vpc) <-> pri-sgp-03 (hc-frontend-vpc)
# ==============================================================================
resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-03-inbound-allow-icmp-from-fe-private-sgp-03" {
  description                  = "Allow Only FROM pri-sgp-03(hc-frontend-vpc) to ping private-instance-03"
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-03-id"]
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
  depends_on                   = [aws_vpc_peering_connection.fe-be-vpc-peering]
}

resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-03-inbound-allow-ssh-from-fe-private-sgp-03" {
  description                  = "Allow Only FROM pri-sgp-03(hc-frontend-vpc) to SSH to private-instance-03"
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-03-id"]
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  depends_on                   = [aws_vpc_peering_connection.fe-be-vpc-peering]
}

resource "aws_vpc_security_group_egress_rule" "be-private-03-outbound-allow-icmp-to-fe-private-sgp-03" {
  description                  = "Allow Only to ping private-instance-03 (hc-frontend-vpc)"
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-03-id"]
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
  depends_on                   = [aws_vpc_peering_connection.fe-be-vpc-peering]
}

resource "aws_vpc_security_group_egress_rule" "be-private-03-outbound-allow-ssh-to-fe-private-sgp-03" {
  description                  = "Allow Only to SSH to private-instance-03 (hc-frontend-vpc)"
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-03-id"]
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  depends_on                   = [aws_vpc_peering_connection.fe-be-vpc-peering]
}
