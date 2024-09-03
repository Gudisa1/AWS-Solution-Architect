---

# AWS VPC Setup: CLI, Terraform, and CloudFormation

This repository provides scripts and templates for setting up an AWS Virtual Private Cloud (VPC) using three different methods: AWS CLI, Terraform, and CloudFormation. Each method creates a VPC with public and private subnets, an Internet Gateway, and related networking components. 

## Overview

- **AWS CLI Script**: A Bash script that uses AWS CLI commands to create and configure a VPC and its associated resources.
- **Terraform Configuration**: A Terraform configuration file to create and manage a VPC and its related components using Infrastructure as Code.
- **CloudFormation Template**: A CloudFormation YAML template to define and deploy a VPC and associated resources as a stack.

## AWS CLI Script

### Description

The `setup-vpc.sh` script automates the creation and configuration of a VPC, subnets, an Internet Gateway, and a Route Table using AWS CLI commands.

### Key Features

- Creates a VPC with DNS support and hostnames enabled.
- Sets up public and private subnets.
- Creates and attaches an Internet Gateway.
- Configures a Route Table for internet access in the public subnet.
- Optionally creates a NAT Gateway (commented out in the script).

### Usage

1. **Save the Script**: Save the script to a file named `setup-vpc.sh`.
2. **Make it Executable**: Run `chmod +x setup-vpc.sh` to make it executable.
3. **Execute the Script**: Run `./setup-vpc.sh` to execute the script and create the VPC resources.

### Example Command

```bash
./setup-vpc.sh
```

## Terraform Configuration

### Description

The `create-vpc.tf` file contains Terraform configuration to create a VPC with associated resources using Infrastructure as Code principles.

### Key Features

- Defines a VPC with DNS support and hostnames enabled.
- Creates public and private subnets.
- Sets up an Internet Gateway and Route Table.
- Associates the public subnet with the Route Table.

### Usage

1. **Initialize Terraform**: Run `terraform init` to initialize the Terraform working directory.
2. **Apply the Configuration**: Run `terraform apply` to apply the configuration and create the VPC resources.

### Example Command

```bash
terraform init
terraform apply
```

## CloudFormation Template

### Description

The `vpc-setup.yaml` CloudFormation template defines and deploys a VPC, subnets, and related resources as a CloudFormation stack.

### Key Features

- Creates a VPC with DNS support and hostnames enabled.
- Defines public and private subnets.
- Sets up an Internet Gateway and Route Table.
- Associates the public subnet with the Route Table.

### Usage

1. **Save the Template**: Save the CloudFormation template to a file named `vpc-setup.yaml`.
2. **Create the Stack**: Use AWS CLI or the AWS Management Console to create a CloudFormation stack from the template.

### Example Command

```bash
aws cloudformation create-stack --stack-name my-vpc-stack --template-body file://vpc-setup.yaml --parameters ParameterKey=VpcCidr,ParameterValue=10.0.0.0/16 ParameterKey=PublicSubnetCidr,ParameterValue=10.0.1.0/24 ParameterKey=PrivateSubnetCidr,ParameterValue=10.0.2.0/24
```

## Naming Conventions

- **Naming Prefix**: The resources created by each method use a "gudisa-" prefix to standardize naming. Adjust these names as needed to fit your organization's naming conventions.
- **Consistency**: Ensure that the names and CIDR blocks used in your VPC setup are consistent with your internal standards and network architecture requirements.

## Conclusion

This repository provides multiple methods for creating and managing AWS VPCs and their associated resources. Choose the method that best fits your workflow and infrastructure management preferences. Customize the parameters and configurations as needed to align with your specific requirements.

---
