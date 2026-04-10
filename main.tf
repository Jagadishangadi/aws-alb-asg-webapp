module "remote_state" {
  source                          = "./modules/remote_state"
  terraform_state_bucket_name     = var.terraform_state_bucket_name
  terraform_state_lock_table_name = var.terraform_state_lock_table_name
}

module "vpc" {
  source              = "./modules/vpc"
  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "security" {
  source       = "./modules/security"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "alb" {
  source            = "./modules/alb"
  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
  target_group_port = var.app_port
  health_check_path = "/"
}

module "compute" {
  source               = "./modules/compute"
  project_name         = var.project_name
  public_subnet_ids    = module.vpc.public_subnet_ids
  instance_type        = var.instance_type
  app_port             = var.app_port
  asg_desired_capacity = var.desired_capacity
  asg_min_size         = var.min_size
  asg_max_size         = var.max_size
  ec2_sg_id            = module.security.ec2_sg_id
  target_group_arn     = module.alb.target_group_arn
}