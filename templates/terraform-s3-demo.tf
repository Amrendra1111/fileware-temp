# NOTICE: This is a demo file for you to get started.
# Make sure to edit and rename the file. If not renamed, the file will not be saved!


# Define the provider
provider "aws" {
  region = "us-west-2"
}

# S3 Bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-unique-bucket-name"

  tags = {
    Name = "example-bucket"
  }
}

