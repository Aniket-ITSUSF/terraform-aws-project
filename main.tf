resource "aws_key_pair" "my_key_pair" {
  key_name   = "tera-custom-key"
  public_key = "ssh-rsa YOUR_PUBLIC_KEY_HERE"
}

provider "aws" {
  region = var.region
}


module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  project_name         = var.project_name
}


module "bastion" {
  source = "./modules/bastion"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_ids[0]
  vpc_id        = module.vpc.vpc_id
  my_ip         = var.my_ip
  key_name      = aws_key_pair.my_key_pair.key_name
  project_name  = var.project_name
}


module "ec2_instances" {
  source = "./modules/ec2_instances"

  ami_id          = var.ami_id
  instance_type   = var.instance_type
  subnet_ids      = module.vpc.private_subnet_ids
  vpc_id          = module.vpc.vpc_id
  bastion_sg_id   = module.bastion.bastion_sg_id
  key_name        = aws_key_pair.my_key_pair.key_name
  instance_count  = 6
  project_name    = var.project_name
}
