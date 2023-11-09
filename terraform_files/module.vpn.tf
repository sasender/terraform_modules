module "my_vpn" {
    source = "./site-to-site_vpn"
    customer_gateway_name = var.customer_gateway_name
    customer_gateway_ip = var.customer_gateway_ip
    transit_gateway_name = var.transit_gateway_name
    destination_cidr_block1 = var.destination_cidr_block1
    destination_cidr_block2 = var.destination_cidr_block2
    subnet_ids               = module.vpc.var.subnet_cidr_blocks
}