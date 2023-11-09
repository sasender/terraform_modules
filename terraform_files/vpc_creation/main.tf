resource "aws_vpc" "teravpc" {
  #cidr_block = var.vpc_cidr_block
  cidr_block           = "${var.vpc_cidr_block}"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "internet_gateway1" {
vpc_id = aws_vpc.teravpc.id

tags ={
Name = "IGW1"
}
}

resource "aws_subnet" "public_subnet" {
vpc_id = aws_vpc.teravpc.id
#cidr_block = "10.0.0.16/28"
cidr_block = "${var.subnet_cidr_blocks}"
tags = {
Name = "tera-subnet"
}
}

# resource "aws_subnet" "public_subnet" {
#   #count = length(var.subnet_cidr_blocks)
#   vpc_id                  = aws_vpc.teravpc.id
#   cidr_block              = var.subnet_cidr_blocks[count.index]
#   availability_zone       = ""  # Modify as needed
# }


resource "aws_route_table" "tera_out" {
vpc_id = aws_vpc.teravpc.id
tags = {
Name = "terraform-route-table"
}
}

resource "aws_route_table_association" "public_subnet_association1" {
subnet_id = aws_subnet.public_subnet.id
route_table_id = aws_route_table.tera_out.id
}

resource "aws_route" "default_route_public_subnet1" {
route_table_id = aws_route_table.tera_out.id
#destination_cidr_block = "0.0.0.0/0"
destination_cidr_block  = var.route_table_cidr1
gateway_id = aws_internet_gateway.internet_gateway1.id
}
# resource "aws_route" "transit-gateway_route_public_subnet1" {
# # route_table_id = aws_route_table.tera_out.id
# # #destination_cidr_block = "172.31.32.0/20"
# # destination_cidr_block  = var.route_table_cidr2
# # depends_on            = aws_ec2_transit_gateway.example.id
# # transit_gateway_id = aws_ec2_transit_gateway.example.id
# # }

resource "aws_security_group" "allowIn" {
name = "allow_inbound"
vpc_id = aws_vpc.teravpc.id

ingress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["10.0.0.0/24"]
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}



