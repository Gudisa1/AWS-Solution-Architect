provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "gudi_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "gudi-vpc"
  }
}

# Create a Public Subnet
resource "aws_subnet" "gudi_public_subnet" {
  vpc_id                  = aws_vpc.gudi_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "gudi-public-subnet"
  }
}

# Create a Security Group
resource "aws_security_group" "gudi" {
  vpc_id = aws_vpc.gudi_vpc.id

  # Allow inbound HTTP traffic (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "gudi-sg"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "gudi_igw" {
  vpc_id = aws_vpc.gudi_vpc.id

  tags = {
    Name = "gudi-igw"
  }
}

# Create a Route Table
resource "aws_route_table" "gudi_route_table" {
  vpc_id = aws_vpc.gudi_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gudi_igw.id
  }

  tags = {
    Name = "gudi-route-table"
  }
}

# Associate the Route Table with the Public Subnet
resource "aws_route_table_association" "gudi_route_table_association" {
  subnet_id      = aws_subnet.gudi_public_subnet.id
  route_table_id = aws_route_table.gudi_route_table.id
}

# Launch an EC2 instance with a simple web server
resource "aws_instance" "gudi_server" {
  ami                  = "ami-066784287e358dad1"  # Amazon Linux 2 AMI
  instance_type        = "t2.micro"
  subnet_id            = aws_subnet.gudi_public_subnet.id
  associate_public_ip_address = true
  security_groups = [aws_security_group.gudi.id]

  # Install a simple web server using user data
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello, World from $(hostname -f)" > /var/www/html/index.html
              EOF

  tags = {
    Name = "gudi-server"
  }
}

output "vpc_id" {
  value = aws_vpc.gudi_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.gudi_public_subnet.id
}

output "sg_id" {
  value = aws_security_group.gudi.id
}

output "igw_id" {
  value = aws_internet_gateway.gudi_igw.id
}

output "route_table_id" {
  value = aws_route_table.gudi_route_table.id
}

output "instance_id" {
  value = aws_instance.gudi_server.id
}

output "public_ip" {
  value = aws_instance.gudi_server.public_ip
}
