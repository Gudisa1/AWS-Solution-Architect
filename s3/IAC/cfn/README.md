
```markdown
# AWS CloudFormation Stack Management

This repository contains bash scripts to create and delete AWS CloudFormation stacks.


## Usage

### 1. Create a CloudFormation Stack

Use the `create_stack.sh` script to create a new CloudFormation stack.

#### Script: `create_stack.sh`

```bash
#!/bin/bash

# Set the stack name and template file
STACK_NAME="your-stack-name"    # Replace with your stack name
TEMPLATE_FILE="template.yaml"   # Replace with your CloudFormation template file

# Create the CloudFormation stack
aws cloudformation create-stack --stack-name "$STACK_NAME" --template-body file://"$TEMPLATE_FILE" --capabilities CAPABILITY_NAMED_IAM

# Optionally, wait for the creation to complete
aws cloudformation wait stack-create-complete --stack-name "$STACK_NAME"

echo "Stack $STACK_NAME created."
```

#### Steps to Run:

1. Replace `"your-stack-name"` and `"template.yaml"` with your stack name and template file.
2. Save the script as `create_stack.sh`.
3. Make the script executable:

   ```bash
   chmod +x create_stack.sh
   ```

4. Run the script:

   ```bash
   ./create_stack.sh
   ```

### 2. Delete a CloudFormation Stack

Use the `delete_stack.sh` script to delete an existing CloudFormation stack.

#### Script: `delete_stack.sh`

```bash
#!/bin/bash

# Set the name of the stack to delete
STACK_NAME="your-stack-name"  # Replace with your stack name

# Delete the CloudFormation stack
aws cloudformation delete-stack --stack-name "$STACK_NAME"

# Optionally, wait for the deletion to complete
aws cloudformation wait stack-delete-complete --stack-name "$STACK_NAME"

echo "Stack $STACK_NAME deleted."
```

#### Steps to Run:

1. Replace `"your-stack-name"` with your stack name.
2. Save the script as `delete_stack.sh`.
3. Make the script executable:

   ```bash
   chmod +x delete_stack.sh
   ```

4. Run the script:

   ```bash
   ./delete_stack.sh
   ```

## Important Notes

- **IAM Roles**: If your stack creates IAM roles, ensure the `CAPABILITY_NAMED_IAM` parameter is included during stack creation.
- **Stack Resources**: Deleting a stack will remove all resources associated with it. Ensure you back up any critical data before deletion.

