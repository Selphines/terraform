provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

####

resource "aws_instance" "my_ubuntu" {
  ami                    = "ami-0194c3e07668a7e36 "
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = <<EOF
#!/bin/bash
apt update -y
apt install apache2 -y
myip='curl http://checkip.amazonaws.com'
echo "<h2>WebServer with my IP: $myip</h2><br>Build by Terraform!" > /var/www/html/index.html
sudo service apache2 start
chekconfig apache2 on
EOF
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

  ingress {
    description = "tcp 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "tcp 443"
    from_port   = 443
    to_port     = 443
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
