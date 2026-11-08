output "aws-region" {
  value = var.aws-region
}
output "fe-vpc-id" {
  description = "VPC ID for frontend"
  value       = aws_vpc.fe-vpc.id
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
output "fe-private-rtb-02-id" {
  description = "Frontend private route table 02"
  value       = aws_route_table.fe-private-rtb-02.id
}
output "fe-private-rtb-03-id" {
  description = "Frontend private route table 03"
  value       = aws_route_table.fe-private-rtb-03.id
}