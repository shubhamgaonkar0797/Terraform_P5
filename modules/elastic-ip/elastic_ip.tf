resource "aws_eip" "contentsphere_eip" {
  domain = "vpc"

  instance = aws_instance.contentsphere_server.id

  tags = {
    Name        = "contentsphere-eip"
    Project     = "ContentSphere"
    Environment = "dev"
  }
}
