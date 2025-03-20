output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.private_instances[*].id
}

output "instance_private_ips" {
  description = "Private IPs of the EC2 instances"
  value       = aws_instance.private_instances[*].private_ip
}
