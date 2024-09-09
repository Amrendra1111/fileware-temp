# NOTICE: This is a demo file for you to get started.
# Make sure to edit and rename the file. If not renamed, the file will not be saved!

# Provider Configuration
provider "aws" {
  region = "ap-south-1"  # Specify your region
}

# VPC (Virtual Private Cloud)
resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}
