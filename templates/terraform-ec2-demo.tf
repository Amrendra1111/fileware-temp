# NOTICE: This is a demo file for you to get started.
# Make sure to edit and rename the file. If not renamed, the file will not be saved!

# Provider Configuration
provider "aws" {
  region = "ap-south-1"  # Specify your region
}

# EC2 Instance in Public Subnet
resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
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
    Name = "allow_ssh"
  }
}

resource "aws_instance" "public_ec2" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  subnet_id                   = aws_subnet.public_subnet.id
  security_groups             = [aws_security_group.allow_ssh.name]
  associate_public_ip_address = true
  key_name                    = "my-key"  # Make sure this key pair exists

  tags = {
    Name = "public-ec2"
  }
}
