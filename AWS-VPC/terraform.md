---

# AWS VPC Creation with Terraform

This Terraform configuration sets up a Virtual Private Cloud (VPC) along with essential networking components in AWS. It includes creating VPCs, subnets, an Internet Gateway, and configuring routing. 

## Overview

This configuration achieves the following:

1. **Create a VPC**:
   - CIDR block: `10.0.0.0/16`
   - DNS support and hostnames enabled

2. **Create Subnets**:
   - **Public Subnet**: CIDR block `10.0.1.0/24`
   - **Private Subnet**: CIDR block `10.0.2.0/24`

3. **Create an Internet Gateway**:
   - Attach it to the VPC for internet access

4. **Create a Route Table**:
   - Route all outbound traffic (`0.0.0.0/0`) through the Internet Gateway

5. **Associate the Route Table with the Public Subnet**:
   - Ensure instances in the public subnet can access the internet

## Configuration

### Variables

The configuration uses the following variables:

- `region`: The AWS region where the resources will be created (default: `us-east-1`)
- `vpc_cidr`: CIDR block for the VPC (default: `10.0.0.0/16`)
- `public_subnet_cidr`: CIDR block for the public subnet (default: `10.0.1.0/24`)
- `private_subnet_cidr`: CIDR block for the private subnet (default: `10.0.2.0/24`)

### Resources

- **aws_vpc.gudisa_vpc**: Creates the VPC with DNS settings.
- **aws_subnet.gudisa_public_subnet**: Creates a public subnet with public IPs enabled.
- **aws_subnet.gudisa_private_subnet**: Creates a private subnet.
- **aws_internet_gateway.gudisa_igw**: Creates and attaches an Internet Gateway.
- **aws_route_table.gudisa_public_route_table**: Creates a route table with a route to the Internet Gateway.
- **aws_route_table_association.gudisa_public_subnet_association**: Associates the public subnet with the route table.

## Usage

1. **Initialize Terraform**: 
   - Run `terraform init` to initialize the working directory with the Terraform configuration.

2. **Plan the Deployment**:
   - Execute `terraform plan` to see what resources will be created or modified.

3. **Apply the Configuration**:
   - Run `terraform apply` to create the resources defined in the configuration.

4. **Verify Resources**:
   - Check the AWS Management Console to confirm the creation of the VPC, subnets, and other resources.

## Important Notes

- **Naming Conventions**: Ensure that the names used in the tags (e.g., `gudisa-vpc`, `gudisa-public-subnet`) are meaningful and follow your organization's naming conventions.
- **Region**: The default region is `us-east-1`. Modify the `region` variable if you need to deploy resources in a different region.
- **Security Considerations**: This configuration does not include security groups or NAT Gateways. Consider adding these based on your requirements.

## Conclusion

This Terraform configuration provides a foundational setup for creating a VPC environment in AWS. Customize the variables and resources as needed to fit your specific use case and organizational policies.

---
