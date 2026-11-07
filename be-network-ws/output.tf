output "aws-region" {
  value = var.aws-region
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
output "be-vpc-id" {
  description = "VPC ID for backend"
  value       = aws_vpc.be-vpc.id
}
output "be-private-rtb-02-id" {
  description = "Backend private route table 02"
  value       = aws_route_table.be-private-rtb-02.id
}
output "be-private-rtb-03-id" {
  description = "Backend private route table 03"
  value       = aws_route_table.be-private-rtb-03.id
}
output "be-public-sgp-01-id" {
  description = "Backend public security group 01"
  value       = aws_security_group.be-public-sgp-01.id
}