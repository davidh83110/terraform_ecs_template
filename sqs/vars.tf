variable "sqs_name" {}

variable "AWS_ACCOUNT" {}

variable "sqs_max_msg_size" {}

variable "sqs_VISIBILITY_TIMEOUT_SECONDS" {
  default = "30"
}

variable "sqs_DELAY_SECONDS" {
  default = "0"
}

variable "sqs_MESSAGE_RETENTION_SECONDS" {
  default = "345600"
}

variable "sqs_RECEIVE_WAIT_TIME_SECONDS" {
  default = "0"
}
