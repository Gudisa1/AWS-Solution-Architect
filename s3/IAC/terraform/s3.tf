resource "aws_s3_bucket" "Gudisa-Bucket" {
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}