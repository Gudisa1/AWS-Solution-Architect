resource "aws_s3_bucket" "Gudisa_Bucket" {
  bucket = "gudisa-files-bucket"  # Replace with a globally unique bucket name
  
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
