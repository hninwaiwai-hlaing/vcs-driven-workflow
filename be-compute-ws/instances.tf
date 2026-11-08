resource "aws_instance" "be-public-instance-01" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t3.micro"
  subnet_id              = data.terraform_remote_state.be-vpc.outputs["be-public-subnet-01"][0].id
  vpc_security_group_ids = [data.terraform_remote_state.be-security.outputs["be-public-sgp-01-id"]]
  key_name               = aws_key_pair.be_key_pair.key_name
  associate_public_ip_address = true

  tags = {
    Name = "be-public-instance-01"
  }

  depends_on = [
    data.terraform_remote_state.be-vpc,
    data.terraform_remote_state.be-security
  ]
}

resource "aws_instance" "be-private-instance-01" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t3.micro"
  subnet_id              = data.terraform_remote_state.be-vpc.outputs["be-private-subnet-01"][0].id
  vpc_security_group_ids = [data.terraform_remote_state.be-security.outputs["be-private-sgp-01-id"]]
  key_name               = aws_key_pair.be_key_pair.key_name

  tags = {
    Name = "be-private-instance-01"
  }

  depends_on = [
    data.terraform_remote_state.be-vpc,
    data.terraform_remote_state.be-security
  ]
}
resource "aws_instance" "be-private-instance-02" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t3.micro"
  subnet_id              = data.terraform_remote_state.be-vpc.outputs["be-private-subnet-02"][0].id
  vpc_security_group_ids = [data.terraform_remote_state.be-security.outputs["be-private-sgp-02-id"]]
  key_name               = aws_key_pair.be_key_pair.key_name

  tags = {
    Name = "be-private-instance-02"
  }

  depends_on = [
    data.terraform_remote_state.be-vpc,
    data.terraform_remote_state.be-security
  ]
}

resource "aws_instance" "be-private-instance-03" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t3.micro"
  subnet_id              = data.terraform_remote_state.be-vpc.outputs["be-private-subnet-03"][0].id
  vpc_security_group_ids = [data.terraform_remote_state.be-security.outputs["be-private-sgp-03-id"]]
  key_name               = aws_key_pair.be_key_pair.key_name

  tags = {
    Name = "be-private-instance-03"
  }
  
  depends_on = [
    data.terraform_remote_state.be-vpc,
    data.terraform_remote_state.be-security
  ]
}