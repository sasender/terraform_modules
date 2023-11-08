output "transit_gateway_id" {
  description = "ID of the Transit Gateway"
  value   = aws_ec2_transit_gateway.example.id
}

output "transit_gateway_route_table_ids" {
  description = "IDs of Transit Gateway route tables"
  value       = aws_ec2_transit_gateway_route_table.example[*].id
}

