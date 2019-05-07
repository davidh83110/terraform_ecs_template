output "nlb_tg_id" {
  value = "${aws_nlb_target_group.main.id}"
}

output "nlb_http_id" {
  value = "${aws_lb.main.id}"
}

output "nlb_http_zone_id" {
  value = "${aws_lb.main.zone_id}"
}

output "nlb_http_dns_name" {
  value = "${aws_lb.main.dns_name}"
}
