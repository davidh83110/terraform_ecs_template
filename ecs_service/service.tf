

resource "aws_ecs_task_definition" "auth" {
  family = "${var.ecs_service_name}"

  container_definitions = <<DEFINITION
[
  {
    "portMappings": [
      {
        "hostPort": 0,
        "protocol": "tcp",
        "containerPort": ${var.alb_container_port}
      }
    ],
    "cpu": 0,
    "environment": [
      {
        "name": "RAILS_ENV",
        "value": "production"
      },
      {
        "name": "UNICORN_WORKERS",
        "value": "4"
      }
    ],
    "memoryReservation": 512,
    "image": "${var.ecs_unicorn_container_image}",
    "essential": true,
    "name": "${var.ecs_service_name}"
  }
]
DEFINITION
}

resource "aws_ecs_service" "auth" {
  name                               = "${var.ecs_service_name}"
  cluster                            = "${var.ecs_cluster_id}"
  desired_count                      = "${var.ecs_desired_count}"
  iam_role                           = "ecsServiceRole"
  task_definition                    = "${aws_ecs_task_definition.auth.family}:${aws_ecs_task_definition.auth.revision}"
  deployment_minimum_healthy_percent = "${var.ecs_minimum_healthy_percent}"
  deployment_maximum_percent         = "${var.ecs_maximum_healthy_percent}"
  health_check_grace_period_seconds  = "${var.ecs_health_check_grace_period_seconds}"

  placement_strategy {
      type = "${var.ecs_placement_strategy_type}"
      field = "${var.ecs_placement_strategy_field}"
    # type  = "spread"
    # field = "instanceId"
  }

  load_balancer {
    target_group_arn = "${var.alb_target_group_id}"
    container_name   = "${var.ecs_service_name}"
    container_port   = "${var.alb_container_port}"
  }
}
