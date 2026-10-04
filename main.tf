resource "aws_vpc" "contentsphere_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "contentsphere-vpc"
    Project     = "ContentSphere"
    Environment = "dev"
  }
}



resource "aws_subnet" "contentsphere_subnet" {
  vpc_id                  = aws_vpc.contentsphere_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "contentsphere-subnet"
    Project     = "ContentSphere"
    Environment = "dev"
  }
}



resource "aws_internet_gateway" "contentsphere_igw" {
  vpc_id = aws_vpc.contentsphere_vpc.id

  tags = {
    Name        = "contentsphere-igw"
    Project     = "ContentSphere"
    Environment = "dev"
  }
}



resource "aws_route_table" "contentsphere_route_table" {
  vpc_id = aws_vpc.contentsphere_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.contentsphere_igw.id
  }

  tags = {
    Name        = "contentsphere-route-table"
    Project     = "ContentSphere"
    Environment = "dev"
  }
}
resource "aws_route_table_association" "contentsphere_subnet_association" {
  subnet_id      = aws_subnet.contentsphere_subnet.id
  route_table_id = aws_route_table.contentsphere_route_table.id
}



resource "aws_security_group" "contentsphere_sg" {
  name        = "contentsphere-sg"
  description = "Security group for ContentSphere EC2"
  vpc_id      = aws_vpc.contentsphere_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
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

  tags = {
    Name        = "contentsphere-sg"
    Project     = "ContentSphere"
    Environment = "dev"
  }
}



resource "aws_instance" "contentsphere_server" {
  ami           = "ami-007b1f3fdea0383d9"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.contentsphere_subnet.id

  vpc_security_group_ids = [
    aws_security_group.contentsphere_sg.id
  ]

  key_name = "General"

  tags = {
    Name        = "contentsphere-web-server"
    Project     = "ContentSphere"
    Environment = "dev"
  }
}



resource "aws_eip" "contentsphere_eip" {
  domain = "vpc"

  instance = aws_instance.contentsphere_server.id

  tags = {
    Name        = "contentsphere-eip"
    Project     = "ContentSphere"
    Environment = "dev"
  }
}



resource "aws_s3_bucket" "contentsphere_bucket" {
  bucket = "contentsphere-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "contentsphere-bucket"
    Project     = "ContentSphere"
    Environment = "dev"
  }
}

data "aws_caller_identity" "current" {}




