output "alb_tg_id" {
  value = "${aws_alb_target_group.main.id}"
}

output "alb_http_id" {
  value = "${aws_alb.main.id}"
}

output "alb_http_zone_id" {
  value = "${aws_alb.main.zone_id}"
}
