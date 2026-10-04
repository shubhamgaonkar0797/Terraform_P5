output "vpc_id" {
  description = "ID of the ContentSphere VPC"
  value       = aws_vpc.this.id
}

output "subnet_id" {
  description = "ID of the ContentSphere subnet"
  value       = aws_subnet.this.id
}

output "route_table_id" {
  description = "ID of the ContentSphere route table"
  value       = aws_route_table.this.id
}

output "internet_gateway_id" {
  description = "ID of the ContentSphere internet gateway"
  value       = aws_internet_gateway.this.id
}
