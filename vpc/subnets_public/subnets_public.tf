resource "aws_subnet" "public-a" {
  vpc_id                  = "${var.vpc}"
  cidr_block              = "${var.subnet_public_a_cidr}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.subnet_public_a_name}"
  }
}

resource "aws_subnet" "public-b" {
  vpc_id                  = "${var.vpc}"
  cidr_block              = "${var.subnet_public_b_cidr}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.subnet_public_b_name}"
  }
}
