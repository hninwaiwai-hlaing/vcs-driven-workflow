resource "aws_security_group" "be-public-sgp-01" {
  name        = "be-public-sgp-01"
  description = "Security Group for backend public instance 01"
  vpc_id      = data.terraform_remote_state.be-vpc.outputs["be-vpc-id"]

  tags = {
    Name = "be-public-sgp-01"
  }
}
resource "aws_vpc_security_group_ingress_rule" "be-public-sgp-01-inbound-allow-icmp" {
  description       = "Allow Only local IP to ping public-instance-01 (hc-backend-vpc)"
  security_group_id = aws_security_group.be-public-sgp-01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "icmp"
  from_port         = 8
  to_port           = 0
}
resource "aws_vpc_security_group_ingress_rule" "be-public-sgp-01-inbound-allow-ssh" {
  description       = "Allow Only local IP to SSH to public-instance-01 (hc-backend-vpc)"
  security_group_id = aws_security_group.be-public-sgp-01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}
resource "aws_vpc_security_group_egress_rule" "be-public-sgp-01-outbound-allow-all" {
  description       = "Allow ALL types of traffic to destination 0.0.0.0/0"
  security_group_id = aws_security_group.be-public-sgp-01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# ==============================================================================
# 2. Backend Private Security Group 01 (be-private-sgp-01)
# ==============================================================================
resource "aws_security_group" "be-private-sgp-01" {
  name        = "be-private-sgp-01"
  description = "Security Group for backend private instance 01"
  vpc_id      = data.terraform_remote_state.be-vpc.outputs["be-vpc-id"]

  tags = {
    Name = "be-private-sgp-01"
  }
}

resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-01-inbound-allow-icmp" {
  description                  = "Allow Only be-public-sgp-01 to ping be-private-instance-01"
  security_group_id            = aws_security_group.be-private-sgp-01.id
  referenced_security_group_id = aws_security_group.be-public-sgp-01.id
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
}

resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-01-inbound-allow-ssh" {
  description                  = "Allow SSH from be-private-sgp-01"
  security_group_id            = aws_security_group.be-private-sgp-01.id
  referenced_security_group_id = aws_security_group.be-public-sgp-01.id
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
}

resource "aws_vpc_security_group_egress_rule" "be-private-sgp-01-outbound-allow-all" {
  description       = "Allow ALL types of traffic to destination 0.0.0.0/0"
  security_group_id = aws_security_group.be-private-sgp-01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# ==============================================================================
# 3. Backend Private Security Group 02 (be-private-sgp-02) 
# ==============================================================================
resource "aws_security_group" "be-private-sgp-02" {
  name        = "be-private-sgp-02"
  description = "Security Group for backend private instance 02"
  vpc_id      = data.terraform_remote_state.be-vpc.outputs["be-vpc-id"]

  tags = {
    Name = "be-private-sgp-02"
  }
}

resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-02-inbound-allow-icmp-from-be-private-sgp-01" {
  description                  = "Allow Only FROM be-private-sgp-01 to ping private-instance-02"
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

# ==============================================================================
# 4. Backend Private Security Group 03 (pri-sgp-03) - Local Rules
# ==============================================================================
resource "aws_security_group" "be-private-sgp-03" {
  name        = "be-private-sgp-03"
  description = "Security Group for backend private instance 03"
  vpc_id      = data.terraform_remote_state.be-vpc.outputs["be-vpc-id"]

  tags = {
    Name = "be-private-sgp-03"
  }
}

resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-03-inbound-allow-icmp-from-be-private-sgp-01" {
  description                  = "Allow Only FROM be-private-sgp-01 to ping be-private-sgp-03"
  security_group_id            = aws_security_group.be-private-sgp-03.id
  referenced_security_group_id = aws_security_group.be-private-sgp-01.id
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
}

resource "aws_vpc_security_group_ingress_rule" "be-private-sgp-03-inbound-allow-ssh-from-be-private-sgp-01" {
  description                  = "Allow Only FROM be-private-sgp-01 to SSH to be-private-sgp-03"
  security_group_id            = aws_security_group.be-private-sgp-03.id
  referenced_security_group_id = aws_security_group.be-private-sgp-01.id
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
}
