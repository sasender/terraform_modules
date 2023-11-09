resource "aws_customer_gateway" "example" {
bgp_asn = 65000 # Your on-premises ASN
ip_address = var.customer_gateway_ip # Your public IP
type = "ipsec.1"
}

# resource "aws_customer_gateway" "example" {
#   type    = "ipsec.1"
#   bgp_asn = var.bgp_asn
#   ip_address = var.customer_gateway_ip
#   tags = {
#     Name = var.customer_gateway_name
#   }
# }

resource "aws_ec2_transit_gateway" "example" {
 description = "My Transit Gateway"
 default_route_table_association = "disable"
 default_route_table_propagation  = "disable"
   tags = {
    Name = var.transit_gateway_name
  }
}

 resource "aws_ec2_transit_gateway_route_table" "example" {
 transit_gateway_id = aws_ec2_transit_gateway.example.id
 #propagation_custom_route_table = true 
 #propagation_default_route_table = false

  tags = {
    Name = "terraform-transit_gateway"
    }

  }

  resource "aws_ec2_transit_gateway_route_table_association" "association" {
  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpn_attachment.example.id
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.example.id}"
  #transit_gateway_vpn_attachment  = transit_gateway_vpn_attachment.example.id

}

resource "aws_ec2_transit_gateway_route_table_association" "vpc_association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.example.id}"
  #transit_gateway_vpn_attachment  = transit_gateway_vpn_attachment.example.id

}


resource "aws_ec2_transit_gateway_route_table_propagation" "vpc_propagation" {
    transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id}"
    transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.example.id}"
}

resource "aws_ec2_transit_gateway_route_table_propagation" "propagation" {
    transit_gateway_attachment_id  = "${data.aws_ec2_transit_gateway_vpn_attachment.example.id}"
    transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.example.id}"
}

resource "aws_ec2_transit_gateway_route" "example" {
  destination_cidr_block         = var.destination_cidr_block1
  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpn_attachment.example.id
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.example.id}"
}

resource "aws_ec2_transit_gateway_route" "vpc_example" {
  destination_cidr_block         = var.destination_cidr_block2
  transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.example.id}"
}



######## vpc_attachment 


resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attachment" {
#subnet_ids = ["aws_subnet.subnet.id"]
#subnet_ids = ["subnet-033b63d1ef5dfbcef"]
subnet_ids = [ "${aws_subnet.public_subnet.id}" ]
transit_gateway_id = aws_ec2_transit_gateway.example.id
vpc_id = aws_vpc.teravpc.id
}

########### creation_vpn_connection #######

resource "aws_vpn_connection" "example" {
customer_gateway_id = aws_customer_gateway.example.id
transit_gateway_id = aws_ec2_transit_gateway.example.id
type = "ipsec.1"
static_routes_only = true # Set to true for static routes
#destination_cidr_block = "0.0.0.0/0"


}

data "aws_ec2_transit_gateway_vpn_attachment" "example" {
transit_gateway_id = aws_ec2_transit_gateway.example.id
vpn_connection_id = aws_vpn_connection.example.id
}
