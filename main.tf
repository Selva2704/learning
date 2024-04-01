provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "one" {
  cidr_block = "10.0.0.0/16"

}


resource "aws_subnet" "two_a" {
  vpc_id     = aws_vpc.one.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}
resource "aws_subnet" "two_b" {
  vpc_id     = aws_vpc.one.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}
resource "aws_subnet" "two_c" {
  vpc_id     = aws_vpc.one.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"
}

resource "aws_security_group" "three" {
  name_prefix = "my-sg"
  vpc_id      = aws_vpc.one.id

 }

resource "aws_instance" "four" {
  ami           = "ami-080e1f13689e07408"
  instance_type = "t2.micro"  
  subnet_id     = aws_subnet.two_a.id
  security_groups = [aws_security_group.three.id]

}

resource "aws_instance" "five" {
  ami           = "ami-080e1f13689e07408"
  instance_type = "t2.micro"

  subnet_id     = aws_subnet.two_b.id
  security_groups = [aws_security_group.three.id]
}
output "instance_ids" {
  value = {
    Instance_1 = aws_instance.four.id,
    Instance_2 = aws_instance.five.id
  }
}
