output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.teravpc.id
}

# output "subnet_ids" {
#   description = "List of subnet IDs"
#   value       = aws_subnet.example_subnet[*].id
# }

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = aws_subnet.public_subnet.id
}

output "security_group_id" {
  description = "The ID of the AWS security group"
  value       = aws_security_group.allowIn.id
}

# output "security_group_name" {
#   description = "The name of the AWS security group"
#   value       = aws_security_group.allowIn.name
# }




