// ec2/main.tf
resource "aws_instance" "public" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  tags = {
    Name = "public-instance"
  }
}

resource "aws_instance" "private" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  tags = {
    Name = "private-instance"
  }
}
