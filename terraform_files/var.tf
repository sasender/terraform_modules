variable "region" {
  default = null

}

variable "ACCOUNT" {
    default = null
  
}
###########################################################
# variable "subnet_cidr_blocks" {
#   description = "List of CIDR blocks for VPC subnets"
#   type        = list(string)
# }
############################################

variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for VPC subnets"
  #type        = list(string)
  default = null
}

variable "vpc_cidr_block" {
    description = "cider-block"
    default = null
  
}

variable "vpc_name" {
    description = "listing the name of the vpc"
    default  = null  
}

variable "igw_name" {
  description = "The name of the Internet Gateway"
  type        = string
}
variable "name" {

    description = "lisiting of the name"
    default  = null  
}

variable "environment" {
  
    description = "lisiting of the name"
    default  = null  
}

variable "route_table_cidr1" {
    description = "lisiting of the name"
    default  = null 
}

variable "route_table_cidr2" {
    description = "lisiting of the name"
    default  = null 
}

variable "customer_gateway_name" {

    description = "name of the customer gateway"
    default = null
  
}

variable "customer_gateway_ip" {

    description = "value of the customer gateway"

    default = null
  
}
variable "transit_gateway_name" {

    description = "value of the customer gateway"

    default = null
  
}

variable "destination_cidr_block1" {
    description = "value of the customer gateway"

    default = null
}

variable "destination_cidr_block2" {
    description = "value of the customer gateway"

    default = null
}

