terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}


resource "aws_security_group" "Web_hosting_sg" {
    name = "web_hosting_sg"
    description = "Allow http and ssh only"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}



resource "aws_instance" "Webhosting_terraform" {
    ami = var.ami
    key_name = var.key_pair
    instance_type = var.instance_type
    security_groups = [aws_security_group.Web_hosting_sg.name]
    user_data = file("user_data.sh")
    

    tags ={
        Name = "Webhosting_Terraform"
    }
}