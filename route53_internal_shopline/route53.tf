data "aws_route53_zone" "internal" {
  name         = "internal.shopline."
  private_zone = true
}

resource "aws_route53_record" "main" {
  zone_id = "${data.aws_route53_zone.internal.zone_id}"
  name    = "${var.route53_internal_name}"
  type    = "A"

  alias {
    name                   = "${var.route53_internal_lb_dns_name}"
    zone_id                = "${var.route53_internal_lb_zone_id}"
    evaluate_target_health = false
  }
}
