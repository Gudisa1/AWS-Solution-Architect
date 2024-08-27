require 'aws-sdk-s3'
require 'pry'
# require ''
# Initialize the S3 client
s3 = Aws::S3::Client.new(region: 'us-east-1') # Replace with your preferred region

# Get the bucket name from environment variable
bucket_name = ENV['BUCKET_NAME']

# Check if the bucket name is provided
if bucket_name.nil? || bucket_name.empty?
  puts "Error: No BUCKET_NAME environment variable set."
  puts "Usage: export BUCKET_NAME='your-bucket-name' && ruby create_bucket.rb"
  exit 1
end

# Create the bucket
begin
  s3.create_bucket(bucket: bucket_name)
  puts "Bucket '#{bucket_name}' created successfully."
rescue Aws::S3::Errors::ServiceError => e
  puts "Error creating bucket: #{e.message}"
end
