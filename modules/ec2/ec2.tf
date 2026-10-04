resource "aws_instance" "contentsphere_server" {
  ami           = "ami-007b1f3fdea0383d9"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.contentsphere_subnet.id

  vpc_security_group_ids = [
    aws_security_group.contentsphere_sg.id
  ]

  key_name = "General"

  tags = {
    Name        = "contentsphere-server"
    Project     = "ContentSphere"
    Environment = "dev"
  }
}
