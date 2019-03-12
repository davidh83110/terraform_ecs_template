resource "aws_sqs_queue" "sqs" {
  name                       = "${var.sqs_name}"
  max_message_size           = "${var.sqs_max_msg_size}"
  visibility_timeout_seconds = "${var.sqs_VISIBILITY_TIMEOUT_SECONDS}"
  delay_seconds              = "${var.sqs_DELAY_SECONDS}"
  message_retention_seconds  = "${var.sqs_MESSAGE_RETENTION_SECONDS}"
  receive_wait_time_seconds  = "${var.sqs_RECEIVE_WAIT_TIME_SECONDS}"
}

resource "aws_sqs_queue_policy" "sqs-policy" {
  queue_url = "${aws_sqs_queue.sqs.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "allowSameAccountSendMessage",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.sqs.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "arn:aws:sns:ap-southeast-1:${var.AWS_ACCOUNT}:*"
        }
      }
    }
  ]
}
POLICY
}
