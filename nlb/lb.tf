resource "aws_lb_target_group" "main" {
  name                 = "NLB-${var.service_name}"
  port                 = "${var.nlb_port}"
  protocol             = "${var.nlb_protocol}"
  vpc_id               = "${var.vpc}"
  deregistration_delay = "${var.nlb_deregistration_delay}"
  stickiness           = []

  health_check = {
    path                = "${var.nlb_health_check_page}"
    timeout             = "${var.nlb_health_check_timeout}"
    interval            = "${var.nlb_health_check_interval}"
    healthy_threshold   = "${var.nlb_health_check_healthy_threshold}"
    unhealthy_threshold = "${var.nlb_health_check_unhealthy_threshold}"
  }
}

resource "aws_lb" "main" {
  name                             = "NLB-${var.service_name}"
  load_balancer_type               = "network"
  subnets                          = ["${var.nlb_subnet_a}", "${var.nlb_subnet_b}"]
  enable_cross_zone_load_balancing = false
  enable_http2                     = false
  internal                         = "${var.nlb_internal}"
}
