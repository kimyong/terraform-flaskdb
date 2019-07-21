provider "aws" {
  region = "${var.aws_region}"
}

module "appserver_cluster" {
  source = "../../../../modules/services/appserver-cluster"

  ami = "ami-0dabc6f49322786bd"
  server_text = "New server text"

  aws_region             = "${var.aws_region}"
  cluster_name           = "${var.cluster_name}"
  db_remote_state_bucket = "${var.db_remote_state_bucket}"
  db_remote_state_key    = "${var.db_remote_state_key}"
  db_password            = "${var.db_password}"

  instance_type      = "t2.micro"
  min_size           = 1 
  max_size           = 4 
  enable_autoscaling = 1  
}

terraform {
  backend "s3" {
    bucket = "kdatabucket"
    key    = "terraform/app/terraform_dev.tfstate"
    region = "ap-southeast-1"
  }
}
