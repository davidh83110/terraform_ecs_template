output "alb_listener_https_id" {
  value = "${aws_lb_listener.https.id}"
}

output "alb_listener_http_id" {
  value = "${aws_alb_listener.http.id}"
}
