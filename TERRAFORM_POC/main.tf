# Create VPC
resource "aws_vpc" "Terraformmy_vpc" {
  cidr_block = "10.0.0.0/16" # Update CIDR block as needed
}
 
# Create public subnet
resource "aws_subnet" "Terraformpublic_subnet" {
  vpc_id            = aws_vpc.Terraformmy_vpc.id
  cidr_block        = "10.0.1.0/24" # Update CIDR block as needed
  availability_zone = "us-west-2a"   # Update availability zone as needed
 
  map_public_ip_on_launch = true
}
 
# Create security group
resource "aws_security_group" "Terraformmy_security_group" {
  vpc_id = aws_vpc.Terraformmy_vpc.id
 
 
   ingress {
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
    }
 
   egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
    }
}
 
# Create EC2 instance
resource "aws_instance" "Terraform" {
  ami           = "ami-008fe2fc65df48dac" # Change to your desired AMI ID
  instance_type = "t2.micro"               # Change to your desired instance type
  subnet_id     = aws_subnet.Terraformpublic_subnet.id
  security_groups = [aws_security_group.Terraformmy_security_group.id]
 
  tags = {
    Name = "Terraform"
  }
}
