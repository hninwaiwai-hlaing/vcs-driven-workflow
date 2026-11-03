# 1. Generate a secure private key natively within Terraform
resource "tls_private_key" "be_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# 2. Register the public half of the generated key with AWS
resource "aws_key_pair" "be_key_pair" {
  key_name   = "be-instance-key"
  public_key = tls_private_key.be_key.public_key_openssh
}
# 3. Save the private key directly to your local machine
resource "local_sensitive_file" "be-instance-key-pem" {
  filename        = "${path.module}/be-instance-key.pem" # Saves it right inside your current directory
  content         = tls_private_key.be_key.private_key_pem
  file_permission = "0400" # Automatically restricts access permissions so SSH won't reject it
}

output "private_key" {
  value     = tls_private_key.be_key.private_key_pem
  sensitive = true
}