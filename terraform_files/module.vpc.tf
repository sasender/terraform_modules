module "my_vpc" {
    source = "./vpc_creation"
    vpc_cidr_block = var.vpc_cidr_block
    vpc_name       = var.vpc_name
    region =  var.region
    igw_name = var.igw_name
    route_table_cidr1 = var.route_table_cidr1
    route_table_cidr2 = var.route_table_cidr2
    subnets = "var.subnet_cidr_blocks"
    subnet_cidr_blocks = {
    subnet = "var.subnet_cidr_blocks"
  }
  


}