resource "aws_lb_listener" "https" {
  load_balancer_arn = "${var.alb_http_id}"
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "${var.alb_https_cert_id}"

  default_action {
    target_group_arn = "${var.alb_tg_id}"
    type             = "forward"
  }
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = "${var.alb_http_id}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
