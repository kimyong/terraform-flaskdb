variable "aws_region" {
  description = "The AWS region to use"
  default     = "ap-southeast-1"
}

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  default     = "appservers-stage"
}

variable "db_remote_state_bucket" {
  description = "The S3 bucket used for the database's remote state"
  default     = "kdatabucket"
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  default     = "terraform/mysql/terraform_dev.tfstate"
}

variable "db_password" {
  description = "DB password"
}
