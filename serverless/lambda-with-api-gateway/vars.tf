variable "function_name" {}
variable "handler" {}
variable "role_arn" {}
variable "s3_bucket" {}
variable "deployment_package_path" {}
variable "stage" {}
variable "runtime" {}

variable "api_gateway_id" {}
variable "api_gateway_root_id" {}
variable "api_getway_method" {}
variable "api_gateway_path_part" {}

variable "security_group_ids" {
  type = "list"
  default = []
}

variable "subnet_ids" {
  type = "list"
  default = []
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