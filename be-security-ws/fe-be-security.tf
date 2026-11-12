# ==============================================================================
# Frontend Private Security Group 02 (pri-sgp-02) <-> Backend pri-sgp-02
# ==============================================================================

resource "aws_vpc_security_group_ingress_rule" "fe-private-sgp-02-inbound-allow-icmp-from-be-private-sgp-02" {
  description                  = "Allow Ping / ICMP Echo Request (Type 8) from pri-sgp-02 (hc-backend-vpc)"
  security_group_id            = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-02-id"]
  referenced_security_group_id = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
  depends_on                   = [data.terraform_remote_state.fe-be-vpc-peering]
}

resource "aws_vpc_security_group_ingress_rule" "fe-private-sgp-02-inbound-allow-ssh-from-be-private-sgp-02" {
  description                  = "Allow SSH from pri-sgp-02 (hc-backend-vpc)"
  security_group_id            = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-02-id"]
  referenced_security_group_id = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  depends_on                   = [data.terraform_remote_state.fe-be-vpc-peering]
}

resource "aws_vpc_security_group_egress_rule" "fe-private-02-outbound-allow-icmp-to-be-private-sgp-02" {
  description                  = "Allow Ping / ICMP to private-instance-02 (hc-backend-vpc)"
  security_group_id            = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-02-id"]
  referenced_security_group_id = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
  depends_on                   = [data.terraform_remote_state.fe-be-vpc-peering]
}

resource "aws_vpc_security_group_egress_rule" "fe-private-02-outbound-allow-ssh-to-be-private-sgp-02" {
  description                  = "Allow SSH to private-instance-02 (hc-backend-vpc)"
  security_group_id            = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-02-id"]
  referenced_security_group_id = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  depends_on                   = [data.terraform_remote_state.fe-be-vpc-peering]
}

# ==============================================================================
# Frontend Private Security Group 03 (pri-sgp-03) <-> Backend pri-sgp-03
# ==============================================================================

resource "aws_vpc_security_group_ingress_rule" "fe-private-sgp-03-inbound-allow-icmp-from-be-private-sgp-03" {
  description                  = "Allow Ping / ICMP Echo Request (Type 8) from pri-sgp-03 (hc-backend-vpc)"
  security_group_id            = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-03-id"]
  referenced_security_group_id = data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
  depends_on                   = [data.terraform_remote_state.fe-be-vpc-peering]
}

resource "aws_vpc_security_group_ingress_rule" "fe-private-sgp-03-inbound-allow-ssh-from-be-private-sgp-03" {
  description                  = "Allow SSH from pri-sgp-03 (hc-backend-vpc)"
  security_group_id            = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-03-id"]
  referenced_security_group_id = data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  depends_on                   = [data.terraform_remote_state.fe-be-vpc-peering]
}

resource "aws_vpc_security_group_egress_rule" "fe-private-03-outbound-allow-icmp-to-be-private-sgp-03" {
  description                  = "Allow Ping / ICMP to private-instance-03 (hc-backend-vpc)"
  security_group_id            = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-03-id"]
  referenced_security_group_id = data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
  depends_on                   = [data.terraform_remote_state.fe-be-vpc-peering]
}

resource "aws_vpc_security_group_egress_rule" "fe-private-03-outbound-allow-ssh-to-be-private-sgp-03" {
  description                  = "Allow SSH to private-instance-03 (hc-backend-vpc)"
  security_group_id            = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-03-id"]
  referenced_security_group_id = data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  depends_on                   = [data.terraform_remote_state.fe-be-vpc-peering]
}


# ==============================================================================
# Cross-VPC Rules for Backend pri-sgp-02 <-> Frontend pri-sgp-02
# ==============================================================================

# Inbound: Allow Ping (ICMP) from frontend pri-sgp-02
resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-02-inbound-allow-icmp-from-fe-private-sgp-02" {
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-02-id"]
  description                  = "Allow Ping / ICMP Echo Request (Type 8) from pri-sgp-02 (hc-frontend-vpc)"
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
  depends_on                   = [data.terraform_remote_state.fe-be-vpc-peering]
}

# Inbound: Allow SSH from frontend pri-sgp-02
resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-02-inbound-allow-ssh-from-fe-private-sgp-02" {
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-02-id"]
  description                  = "Allow SSH from pri-sgp-02 (hc-frontend-vpc)"
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  depends_on                   = [data.terraform_remote_state.fe-be-vpc-peering]
}

# Outbound: Allow Ping (ICMP) to frontend pri-sgp-02
resource "aws_vpc_security_group_egress_rule" "be-private-sgp-02-outbound-allow-icmp-to-fe-private-sgp-02" {
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-02-id"]
  description                  = "Allow Ping / ICMP to private-instance-02 (hc-frontend-vpc)"
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
  depends_on                   = [aws_vpc_peering_connection_options.fe-be-peering-options]
}

# Outbound: Allow SSH to frontend pri-sgp-02
resource "aws_vpc_security_group_egress_rule" "be-private-sgp-02-outbound-allow-ssh-to-fe-private-sgp-02" {
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-02-id"]
  description                  = "Allow SSH to private-instance-02 (hc-frontend-vpc)"
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  depends_on                   = [aws_vpc_peering_connection_options.fe-be-peering-options]
}

# ==============================================================================
# Cross-VPC Rules for Backend pri-sgp-03 <-> Frontend pri-sgp-03
# ==============================================================================

# Inbound: Allow Ping (ICMP) from frontend pri-sgp-03
resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-03-inbound-allow-icmp-from-fe-private-sgp-03" {
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-03-id"]
  description                  = "Allow Ping / ICMP Echo Request (Type 8) from pri-sgp-03 (hc-frontend-vpc)"
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
  depends_on                   = [aws_vpc_peering_connection_options.fe-be-peering-options]
}

# Inbound: Allow SSH from frontend pri-sgp-03
resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-03-inbound-allow-ssh-from-fe-private-sgp-03" {
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-03-id"]
  description                  = "Allow SSH from pri-sgp-03 (hc-frontend-vpc)"
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  depends_on                   = [aws_vpc_peering_connection_options.fe-be-peering-options]
}

# Outbound: Allow Ping (ICMP) to frontend pri-sgp-03
resource "aws_vpc_security_group_egress_rule" "be-private-sgp-03-outbound-allow-icmp-to-fe-private-sgp-03" {
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-03-id"]
  description                  = "Allow Ping / ICMP to private-instance-03 (hc-frontend-vpc)"
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
  depends_on                   = [aws_vpc_peering_connection_options.fe-be-peering-options]
}

# Outbound: Allow SSH to frontend pri-sgp-03
resource "aws_vpc_security_group_egress_rule" "be-private-sgp-03-outbound-allow-ssh-to-fe-private-sgp-03" {
  security_group_id            = data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]
  referenced_security_group_id = data.terraform_remote_state.fe-security.outputs["fe-private-sgp-03-id"]
  description                  = "Allow SSH to private-instance-03 (hc-frontend-vpc)"
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
  depends_on                   = [aws_vpc_peering_connection_options.fe-be-peering-options]
}
