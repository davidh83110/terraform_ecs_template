resource "aws_cloudwatch_log_group" "main" {
  name              = "${var.awslogs_group_name}"
  retention_in_days = "${var.awslogs_retention_days}"

  lifecycle = {
      ignore_changes = ["tags"]
  }
}