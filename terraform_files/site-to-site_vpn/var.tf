variable "customer_gateway_name" {
  description = "The name of the customer gateway"
  type        = string
}

variable "customer_gateway_ip" {
  description = "The IP address of the customer gateway"
  type        = string
}

# variable "bgp_asn" {
#   description = "The BGP ASN (Autonomous System Number) of the customer gateway"
#   type        = number
# }

variable "transit_gateway_name" {
  description = "The name of the Transit Gateway"
  type        = string
}

variable "destination_cidr_block1" {
  description = "First destination CIDR block for the route"
  type        = string
}

variable "destination_cidr_block2" {
  description = "Second destination CIDR block for the route"
  type        = string
}
