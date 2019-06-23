variable "function_name" {}
variable "handler" {}
variable "role_arn" {}
variable "s3_bucket" {}
variable "deployment_package_path" {}
variable "stage" {}
variable "runtime" {}

variable "security_group_id" {}

variable "subnet_ids" {
  type = "list"
}

variable "environment_variables" {
  default = {}
  type = "map"
}

variable "timeout" {
  default = 300
}
variable "memory_size" {
  default = 1024
}