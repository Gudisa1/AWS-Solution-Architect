---

# AWS VPC Creation Script

This Bash script automates the creation of a Virtual Private Cloud (VPC) and its associated resources in AWS using the AWS CLI. The script is designed to be simple and straightforward, but it is important to follow good naming conventions for all resources created.

## Script Overview

The script performs the following steps:

1. **Create a VPC**: 
   - A VPC is created with a CIDR block of `10.0.0.0/16`.
   - The script captures the VPC ID and prints it for reference.

2. **Enable DNS Support and DNS Hostnames**: 
   - The script enables DNS support and DNS hostnames for the VPC, allowing instances within the VPC to use domain names for communication.

3. **Create Subnets**: 
   - Two subnets are created within the VPC, each in a different Availability Zone.
   - Subnet 1 is assigned a CIDR block of `10.0.1.0/24`.
   - Subnet 2 is assigned a CIDR block of `10.0.2.0/24`.

4. **Create an Internet Gateway (IGW)**: 
   - An Internet Gateway is created and attached to the VPC, allowing internet access for resources within the VPC.

5. **Create a Route Table**: 
   - A route table is created for the VPC.
   - A route is added to the route table, directing all outbound traffic (`0.0.0.0/0`) to the Internet Gateway.

6. **Associate Route Table with Subnets**: 
   - The route table is associated with both subnets, ensuring that instances in these subnets can communicate with the internet.

7. **Create a Security Group**: 
   - A security group is created with the following inbound rules:
     - Allow SSH access on port 22 from any IP.
     - Allow HTTP access on port 80 from any IP.
     - Allow HTTPS access on port 443 from any IP.

8. **Optional: Create a NAT Gateway**:
   - The script includes commented-out lines to create a NAT Gateway for private subnet communication with the internet. Uncomment these lines if needed.

## Usage

1. **Modify the Script for Naming Conventions**: 
   - The script uses generic names like `MySecurityGroup` and default CIDR blocks. It is strongly recommended to change these to more descriptive and meaningful names.
   - Example: Instead of `MySecurityGroup`, use something like `gudisa-web-server-sg` to reflect the security group's purpose and ownership.

2. **Run the Script**:
   - Execute the script in your terminal:

     ```bash
     ./create-vpc.sh
     ```

3. **Check Output**:
   - The script will print the IDs of the created resources. Save these IDs for reference or further automation tasks.

## Important Notes

- **Naming Conventions**: Proper naming is crucial for managing AWS resources effectively. Adjust the script to reflect your organization's naming policies.
- **Region**: The script uses `us-east-1` as the default region. Modify the `REGION` variable if you need to create resources in a different region.
- **IAM Permissions**: Ensure that your AWS CLI is configured with IAM credentials that have sufficient permissions to create and modify VPC-related resources.

## Conclusion

This script provides a quick and easy way to set up a basic VPC environment in AWS. By following good practices in naming and managing resources, you can maintain a clean and well-organized cloud infrastructure.

---
