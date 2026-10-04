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
