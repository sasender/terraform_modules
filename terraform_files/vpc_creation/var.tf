variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

# variable "subnet_cidr_blocks" {
#   description = "List of CIDR blocks for VPC subnets"
#   type        = list(string)
# }
variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for VPC subnets"
  default  = null
}


variable "region" {
  description = "The AWS region for the VPC"
  type        = string
}

variable "subnets" {
  description = "A map of availability zones to CIDR blocks, which will be set up as subnets."
  type        = string
}

variable "vpc_name" {
    description = "listing the name of the vpc"
    default  = null  
}
variable "igw_name" {
  description = "The name of the Internet Gateway"
  type        = string
}


variable "route_table_cidr1" {
  description = "First destination CIDR block for the route"
  type        = string
}

variable "route_table_cidr2" {
  description = "Second destination CIDR block for the route"
  type        = string
}
