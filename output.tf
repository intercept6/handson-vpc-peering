#################################################
# VPC A
#################################################
# VPC
output "vpc_a-vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc_a.vpc_id}"
}

# Subnets
output "vpc_a-public_subnets" {
  description = "List of IDs of public subnets"
  value       = ["${module.vpc_a.public_subnets}"]
}

#################################################
# VPC B
#################################################
# VPC
output "vpc_b-vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc_b.vpc_id}"
}

# Subnets
output "vpc_b-public_subnets" {
  description = "List of IDs of public subnets"
  value       = ["${module.vpc_b.public_subnets}"]
}

#################################################
# EC2 A
#################################################
output "ec2_a-instance_id" {
  description = "EC2 instance ID"
  value       = "${module.ec2_a.id[0]}"
}

output "ec2_a-instance_public_ip" {
  description = "Public IP assigned to the EC2 instance"
  value       = "${module.ec2_a.public_ip[0]}"
}

#################################################
# EC2 B
#################################################
output "ec2_b-instance_id" {
  description = "EC2 instance ID"
  value       = "${module.ec2_b.id[0]}"
}

output "ec2_b-instance_public_ip" {
  description = "Public IP assigned to the EC2 instance"
  value       = "${module.ec2_b.public_ip[0]}"
}
