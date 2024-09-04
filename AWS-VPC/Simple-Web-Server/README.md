---

# Terraform VPC and EC2 Setup

This repository contains a Terraform configuration for setting up a basic AWS infrastructure. The setup includes a Virtual Private Cloud (VPC), a public subnet, a security group, an internet gateway, a route table, and an EC2 instance with a simple web server. This setup provides a foundational environment for running web applications on AWS.

## Overview

This Terraform configuration provisions the following AWS resources:

1. **Virtual Private Cloud (VPC)**:

   - **CIDR Block**: `10.0.0.0/16`
   - **Instance Tenancy**: Default
   - **Purpose**: Provides an isolated network environment for your resources.

2. **Public Subnet**:

   - **CIDR Block**: `10.0.1.0/24`
   - **Map Public IP on Launch**: Enabled
   - **Purpose**: Allows resources in this subnet to have public IP addresses and be accessible from the internet.

3. **Security Group**:

   - **Ingress Rule**: Allows inbound HTTP traffic (port 80) from any IP address (`0.0.0.0/0`).
   - **Egress Rule**: Allows all outbound traffic.
   - **Purpose**: Controls inbound and outbound traffic to/from resources associated with this security group.

4. **Internet Gateway**:

   - **Purpose**: Provides internet access to the VPC.

5. **Route Table**:

   - **Route**: Default route (`0.0.0.0/0`) directed to the internet gateway.
   - **Purpose**: Routes traffic from the VPC to the internet via the internet gateway.

6. **Route Table Association**:

   - **Associates**: The public subnet with the route table to ensure that traffic from the subnet can reach the internet.

7. **EC2 Instance**:
   - **AMI**: Amazon Linux 2 (`ami-066784287e358dad1`)
   - **Instance Type**: `t2.micro`
   - **Subnet**: Associated with the public subnet.
   - **Public IP**: Enabled
   - **User Data**: Installs and starts an HTTP server (Apache) and creates a simple "Hello, World" webpage.
   - **Purpose**: Provides a basic web server that is publicly accessible.

## Instructions

1. **Initialize Terraform**

   Before you can create the resources, you need to initialize Terraform. This command downloads the necessary provider plugins and prepares your working directory:

   ```sh
   terraform init
   ```

2. **Review the Execution Plan**

   Generate and review an execution plan to see what Terraform intends to do. This is a safe way to check what changes will be made:

   ```sh
   terraform plan
   ```

3. **Apply the Configuration**

   Apply the Terraform configuration to create the resources defined in the script. Confirm the action when prompted:

   ```sh
   terraform apply
   ```

   This will create all the specified AWS resources and set up the environment according to the configuration.

4. **Verify the Deployment**

   After applying the configuration, Terraform will output details about the created resources. You can use these outputs to verify that everything was set up correctly.

   - **VPC ID**
   - **Public Subnet ID**
   - **Security Group ID**
   - **Internet Gateway ID**
   - **Route Table ID**
   - **EC2 Instance ID**
   - **Public IP Address of EC2 Instance**

   You can access the web server by navigating to the public IP address of the EC2 instance in your web browser. You should see a "Hello, World" message indicating that the web server is running successfully.

## Outputs

The following outputs are provided after applying the Terraform configuration:

- `vpc_id`: The ID of the created VPC.
- `public_subnet_id`: The ID of the public subnet.
- `sg_id`: The ID of the security group.
- `igw_id`: The ID of the internet gateway.
- `route_table_id`: The ID of the route table.
- `instance_id`: The ID of the EC2 instance.
- `public_ip`: The public IP address of the EC2 instance.

## Example Output

Here’s an example of what the Terraform output might look like:

```sh
vpc_id = "vpc-xxxxxxxx"
public_subnet_id = "subnet-xxxxxxxx"
sg_id = "sg-xxxxxxxx"
igw_id = "igw-xxxxxxxx"
route_table_id = "rtb-xxxxxxxx"
instance_id = "i-xxxxxxxxxxxxxxxxx"
public_ip = "x.x.x.x"
```
