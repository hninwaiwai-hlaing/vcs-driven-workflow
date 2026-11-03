output "aws-region" {
  value = var.aws-region
}

output "vpc-id" {
  value = aws_vpc.fe-vpc.id
}

output "fe-public-subnet-01" {
  value = aws_subnet.fe-public-subnet1.*
}
output "fe-private-subnet-01" {
  value = aws_subnet.fe-private-subnet1.*
}
output "fe-private-subnet-02" {
  value = aws_subnet.fe-private-subnet2.*
}
output "fe-private-subnet-03" {
  value = aws_subnet.fe-private-subnet3.*
}