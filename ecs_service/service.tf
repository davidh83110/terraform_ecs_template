resource "aws_ecs_service" "main" {
  name                               = "${var.ecs_service_name}"
  cluster                            = "${var.ecs_cluster_id}"
  desired_count                      = "${var.ecs_desired_count}"
  iam_role                           = "${var.ecs_service_role}"
  task_definition                    = "${var.ecs_task_definition}"
  deployment_minimum_healthy_percent = "${var.ecs_minimum_healthy_percent}"
  deployment_maximum_percent         = "${var.ecs_maximum_healthy_percent}"
  health_check_grace_period_seconds  = "${var.ecs_health_check_grace_period_seconds}"

  ordered_placement_strategy {
    type  = "${var.ecs_placement_strategy_type}"
    field = "${var.ecs_placement_strategy_field}"
  }

  load_balancer {
    target_group_arn = "${var.alb_target_group_id}"
    container_name   = "${var.ecs_service_name}"
    container_port   = "${var.alb_container_port}"
  }

  lifecycle {
    ignore_changes = ["desired_count"]
  }
}
