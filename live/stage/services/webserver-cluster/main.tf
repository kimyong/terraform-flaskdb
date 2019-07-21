provider "aws" {
  region = "${var.aws_region}"
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  ami = "ami-0157770012cd02525"
  server_text = "New server text"

  aws_region             = "${var.aws_region}"
  cluster_name           = "${var.cluster_name}"
  elb_remote_state_bucket = "${var.elb_remote_state_bucket}"
  elb_remote_state_key    = "${var.elb_remote_state_key}"

  instance_type      = "t2.micro"
  min_size           = 1 
  max_size           = 4 
  enable_autoscaling = 1  
}

terraform {
  backend "s3" {
    bucket = "kdatabucket"
    key = "terraform/web/terraform_dev.tfstate"
    region = "ap-southeast-1"
    }
}
