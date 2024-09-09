# NOTICE: This is a demo file for you to get started.
# Make sure to edit and rename the file. If not renamed, the file will not be saved!

# Provider Configuration
provider "aws" {
  region = "ap-south-1"  # Specify your region
}

# Subnets 
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-2a"

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-2a"

  tags = {
    Name = "private-subnet"
  }
}
