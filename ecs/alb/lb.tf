resource "aws_alb_target_group" "main" {
  name                 = "ALB-${var.service_name}"
  port                 = "${var.alb_port}"
  protocol             = "HTTP"
  vpc_id               = "${var.vpc}"
  deregistration_delay = "${var.alb_deregistration_delay}"

  health_check = {
    path                = "${var.alb_health_check_page}"
    timeout             = "${var.alb_health_check_timeout}"
    interval            = "${var.alb_health_check_interval}"
    healthy_threshold   = "${var.alb_health_check_healthy_threshold}"
    unhealthy_threshold = "${var.alb_health_check_unhealthy_threshold}"
  }
}

resource "aws_alb" "main" {
  name                             = "ALB-${var.service_name}"
  subnets                          = ["${var.alb_subnet_a}", "${var.alb_subnet_b}"]
  security_groups                  = ["${var.alb_sg_id}"]
  enable_cross_zone_load_balancing = false
  enable_http2                     = "${var.alb_enable_http2}"
  internal                         = "${var.alb_internal}"
}
