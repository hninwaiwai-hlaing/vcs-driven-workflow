output "aws-region" {
  value = var.aws-region
}

output "vpc-id" {
  value = aws_vpc.be-vpc.id
}

output "be-public-subnet-01" {
  value = aws_subnet.be-public-subnet1.*
}
output "be-private-subnet-01" {
  value = aws_subnet.be-private-subnet1.*
}
output "be-private-subnet-02" {
  value = aws_subnet.be-private-subnet2.*
}
output "be-private-subnet-03" {
  value = aws_subnet.be-private-subnet3.*
}