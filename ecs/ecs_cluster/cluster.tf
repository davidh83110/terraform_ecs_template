resource "aws_ecs_cluster" "cluster" {
  name = "${var.ecs_project_name}"
}
