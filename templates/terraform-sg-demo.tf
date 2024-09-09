# NOTICE: This is a demo file for you to get started.
# Make sure to edit and rename the file. If not renamed, the file will not be saved!

# Provider Configuration
provider "aws" {
  region = "ap-south-1"  # Specify your region
}

resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.main_vpc.id
  name = "allow_ssh_http"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Not recommended for production
  }
  
   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Not recommended for production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "allow_ssh_http"
  }
