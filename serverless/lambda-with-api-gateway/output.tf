output "lambda_arn" {
  value = "${aws_lambda_function.lambda.arn}"
}

output "api_gateway_integration_id" {
  value = "${aws_api_gateway_integration.integration.id}"
}