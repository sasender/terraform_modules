provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "public_subnet" {
  source         = "./modules/subnet"
  subnet_type    = "public"
  vpc_id         = module.vpc.vpc_id
  availability_zone = "us-east-1a"
}

module "private_subnet" {
  source         = "./modules/subnet"
  subnet_type    = "private"
  vpc_id         = module.vpc.vpc_id
  availability_zone = "us-east-1b"
}

module "nat_gateway" {
  source        = "./modules/nat_gateway"
  public_subnet = module.public_subnet.subnet_id
  private_subnet_ids = [module.private_subnet.subnet_id]
}
module "route_table" {
  source = "./modules/route_tables"
  
}