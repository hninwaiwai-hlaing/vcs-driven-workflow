# VPC Peering: Frontend VPC <-> Backend VPC
resource "aws_vpc_peering_connection" "fe-be-vpc-peering" {
  vpc_id      = data.terraform_remote_state.fe-network.outputs.fe-vpc-id
  peer_vpc_id = data.terraform_remote_state.be-network.outputs.be-vpc-id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  depends_on = [ 
    data.terraform_remote_state.fe-network,
    data.terraform_remote_state.be-network
  ]
}
# Frontend Private Route Table 02 -> Backend VPC
resource "aws_route" "fe-private-subnet-02-to-be-private-subnet-02" {
  route_table_id = data.terraform_remote_state.fe-network.outputs.fe-private-rtb-02-id
  destination_cidr_block = data.terraform_remote_state.be-network.outputs["be-private-subnet-01"][0].cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.fe-be-vpc-peering.id
}

# Backend Private Route Table 02 -> Frontend VPC
resource "aws_route" "be-private-subnet-02-to-fe-private-subnet-02" {
  route_table_id = data.terraform_remote_state.be-network.outputs.be-private-rtb-02-id
  destination_cidr_block = data.terraform_remote_state.fe-network.outputs["fe-private-subnet-01"][0].cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.fe-be-vpc-peering.id
}