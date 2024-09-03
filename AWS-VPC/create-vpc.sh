#!/bin/bash

# Set variables
VPC_CIDR="10.0.0.0/16"
SUBNET1_CIDR="10.0.1.0/24"
SUBNET2_CIDR="10.0.2.0/24"
REGION="us-east-1"

# Create VPC
VPC_ID=$(aws ec2 create-vpc --cidr-block $VPC_CIDR --query 'Vpc.VpcId' --output text --region $REGION)
echo "Created VPC: $VPC_ID"

# Enable DNS support and DNS hostname for the VPC
aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-support "{\"Value\":true}" --region $REGION
aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-hostnames "{\"Value\":true}" --region $REGION

# Create Subnets
SUBNET1_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $SUBNET1_CIDR --availability-zone ${REGION}a --query 'Subnet.SubnetId' --output text --region $REGION)
SUBNET2_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $SUBNET2_CIDR --availability-zone ${REGION}b --query 'Subnet.SubnetId' --output text --region $REGION)
echo "Created Subnet 1: $SUBNET1_ID"
echo "Created Subnet 2: $SUBNET2_ID"

# Create an Internet Gateway
IGW_ID=$(aws ec2 create-internet-gateway --query 'InternetGateway.InternetGatewayId' --output text --region $REGION)
echo "Created Internet Gateway: $IGW_ID"

# Attach Internet Gateway to VPC
aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $IGW_ID --region $REGION
echo "Attached Internet Gateway $IGW_ID to VPC $VPC_ID"

# Create Route Table
ROUTE_TABLE_ID=$(aws ec2 create-route-table --vpc-id $VPC_ID --query 'RouteTable.RouteTableId' --output text --region $REGION)
echo "Created Route Table: $ROUTE_TABLE_ID"

# Create Route to Internet Gateway
aws ec2 create-route --route-table-id $ROUTE_TABLE_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID --region $REGION
echo "Created route to Internet Gateway in Route Table $ROUTE_TABLE_ID"

# Associate Route Table with Subnets
aws ec2 associate-route-table --route-table-id $ROUTE_TABLE_ID --subnet-id $SUBNET1_ID --region $REGION
aws ec2 associate-route-table --route-table-id $ROUTE_TABLE_ID --subnet-id $SUBNET2_ID --region $REGION
echo "Associated Route Table $ROUTE_TABLE_ID with Subnets $SUBNET1_ID and $SUBNET2_ID"

# Create a Security Group
SECURITY_GROUP_ID=$(aws ec2 create-security-group --group-name MySecurityGroup --description "My security group" --vpc-id $VPC_ID --query 'GroupId' --output text --region $REGION)
echo "Created Security Group: $SECURITY_GROUP_ID"

# Add inbound rules to Security Group
aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP_ID --protocol tcp --port 22 --cidr 0.0.0.0/0 --region $REGION
aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP_ID --protocol tcp --port 80 --cidr 0.0.0.0/0 --region $REGION
aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP_ID --protocol tcp --port 443 --cidr 0.0.0.0/0 --region $REGION
echo "Added inbound rules to Security Group $SECURITY_GROUP_ID"

# Optionally, create a NAT Gateway (requires an Elastic IP)
# Uncomment the following lines if you need a NAT Gateway

# ALLOCATION_ID=$(aws ec2 allocate-address --query 'AllocationId' --output text --region $REGION)
# echo "Allocated Elastic IP: $ALLOCATION_ID"
# NAT_GW_ID=$(aws ec2 create-nat-gateway --subnet-id $SUBNET1_ID --allocation-id $ALLOCATION_ID --query 'NatGateway.NatGatewayId' --output text --region $REGION)
# echo "Created NAT Gateway: $NAT_GW_ID"

# Output the IDs of the created resources
echo "VPC ID: $VPC_ID"
echo "Subnet 1 ID: $SUBNET1_ID"
echo "Subnet 2 ID: $SUBNET2_ID"
echo "Internet Gateway ID: $IGW_ID"
echo "Route Table ID: $ROUTE_TABLE_ID"
echo "Security Group ID: $SECURITY_GROUP_ID"

