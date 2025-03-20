output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "bastion_public_ip" {
  description = "Public IP of the bastion host"
  value       = module.bastion.bastion_public_ip
}

output "instance_private_ips" {
  description = "Private IPs of the EC2 instances"
  value       = module.ec2_instances.instance_private_ips
}
