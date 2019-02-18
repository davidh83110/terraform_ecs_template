resource "aws_ecs_cluster" "auth" {
  name = "${var.ecs_project_name}"
}