# Create VPC
resource "aws_vpc" "be-vpc" {
  cidr_block           = var.vpc-cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "be-vpc"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "be-igw" {
  vpc_id = aws_vpc.be-vpc.id

  tags = {
    Name = "be-igw"
  }
}

# Create NAT Gateway
resource "aws_eip" "be-nat-eip" {
  domain = "vpc"

  tags = {
    Name = "be-nat-eip"
  }
}
resource "aws_nat_gateway" "be-nat" {
  allocation_id = aws_eip.be-nat-eip.id
  subnet_id     = aws_subnet.be-public-subnet1.id

  tags = {
    Name = "be-nat"
  }

  depends_on = [aws_internet_gateway.be-igw]
}
# public route table
resource "aws_route_table" "be-public-rtb" {
  vpc_id = aws_vpc.be-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.be-igw.id
  }

  tags = {
    Name = "be-public-rtb"
  }
}
resource "aws_route_table_association" "be-public-subnet1-association" {
  subnet_id      = aws_subnet.be-public-subnet1.id
  route_table_id = aws_route_table.be-public-rtb.id
}

# Create private route table 01
resource "aws_route_table" "be-private-rtb-01" {
  vpc_id = aws_vpc.be-vpc.id

  route {
    cidr_block = var.vpc-cidr
    gateway_id = "local"
  }
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.be-nat.id
  }

  tags = {
    Name = "be-private-rtb-01"
  }
}
resource "aws_route_table_association" "be-private-subnet1-association" {
  subnet_id      = aws_subnet.be-private-subnet1.id
  route_table_id = aws_route_table.be-private-rtb-01.id
}

# Create private route table 02
resource "aws_route_table" "be-private-rtb-02" {
  vpc_id = aws_vpc.be-vpc.id

  route {
    cidr_block = var.vpc-cidr
    gateway_id = "local"
  }
  # TODO : peering connection
  #   route {
  #     cidr_block = "0.0.0.0/0"
  #     nat_gateway_id = aws_nat_gateway.be-nat.id
  #   }

  tags = {
    Name = "be-private-rtb-02"
  }
}
resource "aws_route_table_association" "be-private-subnet2-association" {
  subnet_id      = aws_subnet.be-private-subnet2.id
  route_table_id = aws_route_table.be-private-rtb-02.id
}

# Create private route table 03
resource "aws_route_table" "be-private-rtb-03" {
  vpc_id = aws_vpc.be-vpc.id

  route {
    cidr_block = var.vpc-cidr
    gateway_id = "local"
  }
  # TODO : peering connection
  #   route {
  #     cidr_block = "0.0.0.0/0"
  #     nat_gateway_id = aws_nat_gateway.be-nat.id
  #   }

  tags = {
    Name = "be-private-rtb-03"
  }
}
resource "aws_route_table_association" "be-private-subnet3-association" {
  subnet_id      = aws_subnet.be-private-subnet3.id
  route_table_id = aws_route_table.be-private-rtb-03.id
}

# Create private subnets
resource "aws_subnet" "be-public-subnet1" {
  vpc_id     = aws_vpc.be-vpc.id
  cidr_block = var.public-subnet1-cidr
  map_public_ip_on_launch = true
 
  tags = {
    Name = "be-public-subnet1"
  }
}
resource "aws_subnet" "be-public-subnet2" {
  vpc_id     = aws_vpc.be-vpc.id
  cidr_block = var.public-subnet2-cidr

  tags = {
    Name = "be-public-subnet2"
  }
}
resource "aws_subnet" "be-public-subnet3" {
  vpc_id     = aws_vpc.be-vpc.id
  cidr_block = var.public-subnet3-cidr

  tags = {
    Name = "be-public-subnet3"
  }
}

# Create private subnet
resource "aws_subnet" "be-private-subnet1" {
  vpc_id            = aws_vpc.be-vpc.id
  cidr_block        = var.private-subnet1-cidr
  availability_zone = var.availability-zone-a

  tags = {
    Name = "be-private-subnet1"
  }
}
resource "aws_subnet" "be-private-subnet2" {
  vpc_id            = aws_vpc.be-vpc.id
  cidr_block        = var.private-subnet2-cidr
  availability_zone = var.availability-zone-a

  tags = {
    Name = "be-private-subnet2"
  }
}
resource "aws_subnet" "be-private-subnet3" {
  vpc_id            = aws_vpc.be-vpc.id
  cidr_block        = var.private-subnet3-cidr
  availability_zone = var.availability-zone-a

  tags = {
    Name = "be-private-subnet3"
  }
}