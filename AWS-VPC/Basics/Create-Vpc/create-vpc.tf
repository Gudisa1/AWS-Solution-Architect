# Define the AWS provider
provider "aws" {
  region = var.region
}

# Create a VPC with DNS support and DNS hostnames enabled
resource "aws_vpc" "gudisa_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "gudisa-vpc"
  }
}

# Create a public subnet within the VPC
resource "aws_subnet" "gudisa_public_subnet" {
  vpc_id                  = aws_vpc.gudisa_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "gudisa-public-subnet"
  }
}

# Create a private subnet within the VPC
resource "aws_subnet" "gudisa_private_subnet" {
  vpc_id     = aws_vpc.gudisa_vpc.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "gudisa-private-subnet"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "gudisa_igw" {
  vpc_id = aws_vpc.gudisa_vpc.id

  tags = {
    Name = "gudisa-igw"
  }
}

# Create a route table for the public subnet
resource "aws_route_table" "gudisa_public_route_table" {
  vpc_id = aws_vpc.gudisa_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gudisa_igw.id
  }

  tags = {
    Name = "gudisa-public-route-table"
  }
}

# Associate the public subnet with the public route table
resource "aws_route_table_association" "gudisa_public_subnet_association" {
  subnet_id      = aws_subnet.gudisa_public_subnet.id
  route_table_id = aws_route_table.gudisa_public_route_table.id
}

# Variables
variable "region" {
  description = "The AWS region where the VPC will be created"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}
