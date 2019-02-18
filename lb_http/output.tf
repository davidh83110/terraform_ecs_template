output "alb_tg_id" {
  value = "${aws_alb_target_group.auth.id}"
}

output "alb_http_name" {
  value = "value"
}

output "alb_http_id" {
  value = "${aws_alb.auth.id}"
}

output "alb_http_zone_id" {
  value = "${aws_alb.auth.zone_id}"
}
