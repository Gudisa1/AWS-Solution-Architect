
---

# Ruby Script Documentation

## Overview

This Ruby script performs the following tasks:
1. Initializes an Amazon S3 client.
2. Creates an S3 bucket with a name provided through an environment variable.
3. Generates multiple local files with random names and content.
4. Uploads these files to the specified S3 bucket.

## Prerequisites

- **AWS SDK for Ruby:** Ensure that the `aws-sdk-s3` gem is installed. You can add it to your Gemfile or install it using:
  ```bash
  gem install aws-sdk-s3
  ```

- **Environment Variable:** Set the `BUCKET_NAME` environment variable to the desired S3 bucket name before running the script.

## Script Breakdown

### 1. Import Required Libraries

```ruby
require 'aws-sdk-s3'
require 'securerandom'
require 'fileutils'
```
- `aws-sdk-s3`: AWS SDK for Ruby to interact with Amazon S3.
- `securerandom`: Provides methods to generate random data.
- `fileutils`: Provides methods to handle file system operations.

### 2. Initialize the S3 Client

```ruby
s3 = Aws::S3::Client.new(region: 'us-east-1')
```
- Creates an instance of the S3 client connected to the `us-east-1` region. Adjust the region as needed.

### 3. Retrieve and Validate Bucket Name

```ruby
bucket_name = ENV['BUCKET_NAME']

if bucket_name.nil? || bucket_name.empty?
  puts "Error: No BUCKET_NAME environment variable set."
  puts "Usage: export BUCKET_NAME='your-bucket-name' && ruby create_bucket.rb"
  exit 1
end
```
- Retrieves the bucket name from the environment variable `BUCKET_NAME`.
- Checks if the `bucket_name` is set and non-empty. If not, it prints an error message and exits.

### 4. Create the S3 Bucket

```ruby
begin
  s3.create_bucket({
    bucket: bucket_name,
    create_bucket_configuration: {
      location_constraint: 'eu-west-1'
    }
  })
  puts "Bucket '#{bucket_name}' created successfully."
rescue Aws::S3::Errors::ServiceError => e
  puts "Error creating bucket: #{e.message}"
  exit 1
end
```
- Creates the bucket with the specified `bucket_name` in the `eu-west-1` region.
- Prints a success message if the bucket is created, otherwise prints an error message and exits.

### 5. Create Local Directory for Files

```ruby
local_directory = 'files'
FileUtils.mkdir_p(local_directory) unless Dir.exist?(local_directory)
```
- Creates a directory named `files` to store generated files, if it doesn’t already exist.

### 6. Generate Random Content

```ruby
def random_content
  SecureRandom.hex(10) # Generates a random 20-character hex string
end
```
- Defines a method `random_content` that generates a random string of 20 hexadecimal characters.

### 7. Create and Upload Files

```ruby
10.times do |i|
  file_name = "file-#{SecureRandom.hex(4)}.txt"
  file_path = File.join(local_directory, file_name)
  content = random_content

  File.write(file_path, content)
  puts "Created file '#{file_path}' with random content."

  begin
    s3.put_object({
      bucket: bucket_name,
      key: file_name,
      body: File.read(file_path)
    })
    puts "Uploaded '#{file_name}' to bucket '#{bucket_name}'."
  rescue Aws::S3::Errors::ServiceError => e
    puts "Error uploading '#{file_name}': #{e.message}"
  end
end
```
- Loops 10 times to generate and handle 10 files:
  - **Generate File Name and Path:** Creates a file name with a random 8-character hex string.
  - **Create Local File:** Writes random content to a local file in the `files` directory.
  - **Upload to S3:** Reads the file content and uploads it to the S3 bucket.
  - **Print Status:** Outputs the status of file creation and upload. Handles any errors during the upload process.

## Usage

1. **Set the Environment Variable:**

   ```bash
   export BUCKET_NAME='your-bucket-name'
   ```

2. **Run the Script:**

   ```bash
   ruby create_bucket.rb
   ```

This will create the specified S3 bucket and upload 10 files with random content to it. Adjust the number of files and content as needed.

---