variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "project_name" {
  type    = string
  default = "aws-alb-asg-webapp"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "desired_capacity" {
  type    = number
  default = 1
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 3
}

variable "app_port" {
  type    = number
  default = 3000
}

variable "terraform_state_bucket_name" {
  type    = string
  default = "jagadish-tf-state-bucket-example"
}

variable "terraform_state_lock_table_name" {
  type    = string
  default = "jagadish-tf-state-lock"
}