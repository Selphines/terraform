provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

####

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_ubuntu.id
}

resource "aws_instance" "my_ubuntu" {
  ami                    = "ami-0194c3e07668a7e36"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = file("user_data.sh")
  tags = {
    Name = "Ubuntu_Web"
  }
  lifecycle {
    create_before_destroy = true
  }
}

/*
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}
*/

resource "aws_security_group" "allow_tls" {
  name        = "Web_Server_Security_Group"
  description = "My First Security Group"

  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    description = "tcp 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}
