require 'aws-sdk-s3'
require 'securerandom'
require 'fileutils'

# Initialize the S3 client
s3 = Aws::S3::Client.new(region: 'us-east-1') # Replace with your preferred region

# Get the bucket name from the environment variable
bucket_name = ENV['BUCKET_NAME']

# Check if the bucket name is provided
if bucket_name.nil? || bucket_name.empty?
  puts "Error: No BUCKET_NAME environment variable set."
  puts "Usage: export BUCKET_NAME='your-bucket-name' && ruby create_bucket.rb"
  exit 1
end

# Create the bucket
begin
  s3.create_bucket({
    bucket: bucket_name,
    create_bucket_configuration: {
      location_constraint: 'eu-west-1' # Replace with your desired region
    }
  })
  puts "Bucket '#{bucket_name}' created successfully."
rescue Aws::S3::Errors::ServiceError => e
  puts "Error creating bucket: #{e.message}"
  exit 1
end

# Directory for local files
local_directory = 'files'
FileUtils.mkdir_p(local_directory) unless Dir.exist?(local_directory)

# Function to generate random content
def random_content
  SecureRandom.hex(10) # Generates a random 20-character hex string
end

# Create and upload multiple files with random names
10.times do |i|
  file_name = "file-#{SecureRandom.hex(4)}.txt" # Generates a random file name
  file_path = File.join(local_directory, file_name)
  content = random_content

  # Create a local file with random content
  File.write(file_path, content)
  puts "Created file '#{file_path}' with random content."

  # Upload the file to S3
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
