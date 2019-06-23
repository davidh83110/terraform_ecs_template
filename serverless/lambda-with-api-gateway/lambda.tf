resource "aws_lambda_function" "lambda" {
  function_name = "${var.function_name}"
  handler       = "${var.handler}"
  role          = "${var.role_arn}"
  runtime       = "${var.runtime}"

  timeout           = "${var.timeout}"
  memory_size       = "${var.memory_size}"
  s3_bucket         = "${var.s3_bucket}"
  s3_key            = "${aws_s3_bucket_object.lambda_deployment_package.id}"
  s3_object_version = "${aws_s3_bucket_object.lambda_deployment_package.version_id}"
  publish           = true

  vpc_config {
    subnet_ids         = "${var.subnet_ids}"
    security_group_ids = "${var.security_group_ids}"
  }

  environment {
    variables = "${merge(var.environment_variables, map("Name", var.function_name))}"
  }
}

resource "aws_lambda_alias" "alias" {
  name             = "${var.stage}"
  function_name    = "${aws_lambda_function.lambda.arn}"
  function_version = "${aws_lambda_function.lambda.version}"
}

resource "aws_s3_bucket_object" "lambda_deployment_package" {
  bucket = "${var.s3_bucket}"

  # use file path get file name
  key    = "${element(split("/", var.deployment_package_path), length(split("/", var.deployment_package_path))-1)}"
  source = "${var.deployment_package_path}"
}
