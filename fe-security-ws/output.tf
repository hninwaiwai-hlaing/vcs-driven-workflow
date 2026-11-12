output "fe-public-sgp-01" {
  value = aws_security_group.fe-public-sgp-01.*
}
output "fe-private-sgp-01" {
  value = aws_security_group.fe-private-sgp-01.*
}
output "fe-private-sgp-02" {
  value = aws_security_group.fe-private-sgp-02.*
}
output "fe-private-sgp-03" {
  value = aws_security_group.fe-private-sgp-03.*
}


output "fe-public-sgp-01-id" {
  description = "Backend public security group 01"
  value       = aws_security_group.fe-public-sgp-01.id
}
output "fe-private-sgp-01-id" {
  description = "Backend private security group 01"
  value       = aws_security_group.fe-private-sgp-01.id
}
output "fe-private-sgp-02-id" {
  description = "Backend private security group 02"
  value       = aws_security_group.fe-private-sgp-02.id
}
output "fe-private-sgp-03-id" {
  description = "Backend private security group 03"
  value       = aws_security_group.fe-private-sgp-03.id
}