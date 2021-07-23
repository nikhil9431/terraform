# Cloud Service Provider Info
provider "aws" {
  region = "us-east-1"
}

# Creating VPC
resource "aws_vpc" "hitech_vpc" {
  cidr_block = var.Cider_Vpc
 
  tags = {
    Name = "VPC-01"
  }
}

# Creating Subnet-01
resource "aws_subnet" "Subnet_01" {
  cidr_block = var.Cider_Subnet01
  vpc_id = aws_vpc.hitech_vpc.id
 
  tags = {
    Name = "Subnet-01"
  }
}

# Creating Subnet-02
resource "aws_subnet" "subnet_02" {
  cidr_block = "172.10.2.0/24"
  vpc_id = aws_vpc.hitech_vpc.id
 
  tags = {
    Name = "Subnet-02"
  }
}

# Creating Internet gateway
resource "aws_internet_gateway" "HT_Igw" {
  vpc_id = aws_vpc.hitech_vpc.id

  tags = {
    Name = "HT-IGW"
  }
}