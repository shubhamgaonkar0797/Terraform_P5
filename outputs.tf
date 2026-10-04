output "vpc_id" {
  description = "ID of the ContentSphere VPC"
  value       = aws_vpc.contentsphere_vpc.id
}

output "subnet_id" {
  description = "ID of the ContentSphere subnet"
  value       = aws_subnet.contentsphere_subnet.id
}

output "ec2_instance_id" {
  description = "ID of the ContentSphere EC2 instance"
  value       = aws_instance.contentsphere_server.id
}

output "ec2_public_ip" {
  description = "Public IP of the ContentSphere EC2 instance"
  value       = aws_instance.contentsphere_server.public_ip
}

output "elastic_ip" {
  description = "Elastic IP of the ContentSphere EC2 instance"
  value       = aws_eip.contentsphere_eip.public_ip
}

output "s3_bucket_name" {
  description = "ContentSphere S3 bucket name"
  value       = aws_s3_bucket.contentsphere_bucket.bucket
}
