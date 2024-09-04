---

# AWS VPC Creation with CloudFormation

This CloudFormation template sets up a Virtual Private Cloud (VPC) along with necessary networking components in AWS. The resources created include a VPC, subnets, an Internet Gateway, and routing configurations, with names prefixed by "gudisa" for clarity.

## Overview

The template creates the following resources:

1. **VPC**:
   - CIDR block: `10.0.0.0/16`
   - DNS support and hostnames enabled

2. **Subnets**:
   - **Public Subnet**: CIDR block `10.0.1.0/24`
   - **Private Subnet**: CIDR block `10.0.2.0/24`

3. **Internet Gateway**:
   - Attaches to the VPC for internet access

4. **Route Table**:
   - Routes all outbound traffic (`0.0.0.0/0`) through the Internet Gateway

5. **Route Table Association**:
   - Associates the public subnet with the route table

## Template Details

### Parameters

- `VpcCidr`:
  - **Description**: The CIDR block for the VPC.
  - **Type**: String
  - **Default**: `10.0.0.0/16`

- `PublicSubnetCidr`:
  - **Description**: The CIDR block for the public subnet.
  - **Type**: String
  - **Default**: `10.0.1.0/24`

- `PrivateSubnetCidr`:
  - **Description**: The CIDR block for the private subnet.
  - **Type**: String
  - **Default**: `10.0.2.0/24`

### Resources

- **VPC** (`GudisaVpc`):
  - Creates a VPC with DNS support and DNS hostnames enabled.
  
- **Internet Gateway** (`GudisaInternetGateway`):
  - Creates an Internet Gateway and attaches it to the VPC.
  
- **Public Subnet** (`GudisaPublicSubnet`):
  - Creates a public subnet with public IPs enabled.
  
- **Private Subnet** (`GudisaPrivateSubnet`):
  - Creates a private subnet.
  
- **Route Table** (`GudisaPublicRouteTable`):
  - Creates a route table and routes all outbound traffic through the Internet Gateway.
  
- **Route** (`GudisaPublicRoute`):
  - Defines a route for internet access in the public subnet.

- **Subnet Route Table Association** (`GudisaPublicSubnetRouteTableAssociation`):
  - Associates the public subnet with the route table.

### Outputs

- **VpcId**:
  - **Description**: The ID of the VPC.
  - **Value**: Refers to the created VPC.
  
- **PublicSubnetId**:
  - **Description**: The ID of the Public Subnet.
  - **Value**: Refers to the created public subnet.
  
- **PrivateSubnetId**:
  - **Description**: The ID of the Private Subnet.
  - **Value**: Refers to the created private subnet.

## Usage

1. **Deploy the Template**:
   - Save the CloudFormation template to a file, e.g., `vpc-setup.yaml`.

2. **Create the Stack**:
   - Use the AWS Management Console, AWS CLI, or AWS SDKs to create a CloudFormation stack from the template. For example:
     ```bash
     aws cloudformation create-stack --stack-name gudisa-vpc-stack --template-body file://vpc-setup.yaml --parameters ParameterKey=VpcCidr,ParameterValue=10.0.0.0/16 ParameterKey=PublicSubnetCidr,ParameterValue=10.0.1.0/24 ParameterKey=PrivateSubnetCidr,ParameterValue=10.0.2.0/24
     ```

3. **Monitor the Stack Creation**:
   - Check the AWS Management Console or use AWS CLI to monitor the stack creation and verify that all resources are created successfully.

4. **Retrieve Outputs**:
   - After creation, you can retrieve the output values (VPC ID, Subnet IDs) using the AWS Management Console or AWS CLI.

## Important Notes

- **Naming Conventions**: Ensure that the names used in the resources (e.g., `gudisa-vpc`, `gudisa-public-subnet`) are meaningful and align with your organization's naming conventions.
- **Region**: Modify the default values and parameters to match the specific requirements of your AWS environment.
- **Security Considerations**: This template does not include additional security configurations. Consider adding security groups or other measures based on your use case.

## Conclusion

This CloudFormation template provides a foundational setup for creating a VPC environment in AWS. Customize the parameters and resources as needed to fit your specific requirements and organizational policies.

---
