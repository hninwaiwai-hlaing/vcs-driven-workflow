output "be-public-sgp-01" {
  value = aws_security_group.be-public-sgp-01.*
}
output "be-private-sgp-01" {
  value = aws_security_group.be-private-sgp-01.*
}
output "be-private-sgp-02" {
  value = aws_security_group.be-private-sgp-02.*
}
output "be-private-sgp-03" {
  value = aws_security_group.be-private-sgp-03.*
}
output "be-public-sgp-01-id" {
  description = "Backend public security group 01"
  value       = aws_security_group.be-public-sgp-01.id
}
output "be-private-sgp-01-id" {
  description = "Backend private security group 01"
  value       = aws_security_group.be-private-sgp-01.id
}
output "be-private-sgp-02-id" {
  description = "Backend private security group 02"
  value       = aws_security_group.be-private-sgp-02.id
}
output "be-private-sgp-03-id" {
  description = "Backend private security group 03"
  value       = aws_security_group.be-private-sgp-03.id
}