name   = nbb
environment = stage
region = ap-southeast-1
subnet_cidr_blocks = 10.0.0.1/24
vpc_name = test_vpc
igw_name = "my_igw"
customer_gateway_ip = 131.12.24.1
customer_gateway_name = bit
destination_cidr_block1 = 172.32.14.15/20  ###vpn cider range
destination_cidr_block2 = 10.0.0.1/24  ### vpc cidrranges 
route_table_cidr1 = 0.0.0.0/0
route_table_cidr2 = 172.32.14.15/20

