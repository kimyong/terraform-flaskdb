resource "aws_db_instance" "example" {
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  name                = "flaskdb"
  username            = "admin"
  password            = "${var.db_password}"
  skip_final_snapshot = true
}

provider "aws" {
  region = "ap-southeast-1"
  access_key = ""
  secret_key = ""
}

terraform {
  backend "s3" {
    bucket = "kdatabucket"
    key    = "terraform/mysql/terraform_dev.tfstate"
    region = "ap-southeast-1"
  }
}

