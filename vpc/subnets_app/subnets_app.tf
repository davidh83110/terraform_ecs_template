resource "aws_subnet" "app-a" {
  vpc_id     = "${var.vpc}"
  cidr_block = "${var.subnet_app_a_cidr}"

  tags = {
    Name = "${var.subnet_app_a_name}"
  }
}

resource "aws_subnet" "app-b" {
  vpc_id     = "${var.vpc}"
  cidr_block = "${var.subnet_app_b_cidr}"

  tags = {
    Name = "${var.subnet_app_b_name}"
  }
}
