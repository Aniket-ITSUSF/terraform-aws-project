resource "aws_security_group" "private_instances" {
  name        = "${var.project_name}-private-instances-sg"
  description = "Security group for private instances"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [var.bastion_sg_id]
    description     = "SSH access from bastion host"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.project_name}-private-instances-sg"
  }
}

resource "aws_instance" "private_instances" {
  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(var.subnet_ids, count.index % length(var.subnet_ids))
  vpc_security_group_ids = [aws_security_group.private_instances.id]
  key_name               = var.key_name

  tags = {
    Name = "${var.project_name}-private-instance-${count.index + 1}"
  }
}
