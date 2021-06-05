provider "aws" {
  profile = "default"
  region = "${var.region}"
}

resource "aws_vpc" "myvpc" {
   tags = {
     Name = "${var.vpc}"
   }
   cidr_block = "${var.vpc_cidr}"
}

resource "aws_subnet" "subnet1" {
   tags = {
      Name = "${var.subnet1}"
   }
   cidr_block = "${var.subnet1_cidr}"
   vpc_id = "${aws_vpc.myvpc.id}"
   availability_zone = "ap-south-1a"
}

resource "aws_subnet" "subnet2" {
   tags = {
     Name = "${var.subnet2}"
   }
   cidr_block = "${var.subnet2_cidr}"
   vpc_id = "${aws_vpc.myvpc.id}"
   availability_zone = "ap-south-1b"
}

resource "aws_security_group" "mysg" {
   tags = {
     Name = "mysg"
   }
   vpc_id = "${aws_vpc.myvpc.id}"
   ingress {
      protocol = "tcp"
      from_port = 22
      to_port = 22
      cidr_blocks = ["0.0.0.0/0"]
   }
   egress {
      protocol = "tcp"
      from_port = 22
      to_port = 22
      cidr_blocks = ["0.0.0.0/0"]
   } 
}

resource "aws_instance" "ec2" {
   ami = "ami-02e60be79e78fef21"
   instance_type = "t2.micro"
   subnet_id = "${aws_subnet.subnet1.id}"
   tags = {
     Name = "Terraform-ec2"
   }   
   security_groups = ["${aws_security_group.mysg.id}"]
   key_name = "Shahulkey"   
}
