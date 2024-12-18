// subnets/main.tf
resource "aws_subnet" "public" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-north-1"
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-north-1"
  tags = {
    Name = "private-subnet"
  }
}
