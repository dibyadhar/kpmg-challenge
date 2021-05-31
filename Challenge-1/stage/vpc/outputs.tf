/*
   * Outputs
  
*/


output "vpc_id" {

  value = module.kpmg_vpc.vpc_id
}

output "public_subnet_id" {

  value = module.kpmg_vpc.public_subnet_id
}

output "private_subnet_id" {

  value = module.kpmg_vpc.private_subnet_id
}

output "nat_gw_id" {

  value = module.kpmg_vpc.nat_gw_id
}

output "nat_eip" {

  value = module.kpmg_vpc.nat_eip
}