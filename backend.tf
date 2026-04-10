terraform {
  backend "s3" {
    bucket         = "jagadish-tf-state-bucket-example"
    key            = "alb-asg-webapp/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "jagadish-tf-state-lock"
    encrypt        = true
  }
}