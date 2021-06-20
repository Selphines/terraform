provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}


/*
resource "aws_instance" "my_ubuntu" {
  ami           = "ami-0194c3e07668a7e36 "
  instance_type = "t3.micro"
}
*/
