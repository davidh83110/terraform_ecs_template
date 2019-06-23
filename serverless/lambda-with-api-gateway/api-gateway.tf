resource "aws_api_gateway_resource" "resource" {
  rest_api_id = "${var.api_gateway_id}"
  parent_id   = "${var.api_gateway_root_id}"
  path_part   = "${var.api_gateway_path_part}"
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = "${var.api_gateway_id}"
  resource_id   = "${aws_api_gateway_resource.resource.id}"
  http_method   = "${var.api_getway_method}"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = "${var.api_gateway_id}"
  resource_id             = "${aws_api_gateway_resource.resource.id}"
  http_method             = "${aws_api_gateway_method.method.http_method}"
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:ap-southeast-1:lambda:path/2015-03-31/functions/${aws_lambda_function.lambda.arn}:${var.stage}/invocations"
}

resource "aws_lambda_permission" "permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda.function_name}"
  qualifier     = "${var.stage}"
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:ap-southeast-1:${data.aws_caller_identity.current.account_id}:${var.api_gateway_id}/*/${aws_api_gateway_method.method.http_method}${aws_api_gateway_resource.resource.path}"
}