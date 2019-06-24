output "awslogs_group_name" {
  value = "${aws_cloudwatch_log_group.main.name}"
}
