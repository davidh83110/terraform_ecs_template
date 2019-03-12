# EC2
data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  name_regex = "^amzn-ami-.*-amazon-ecs-optimized$"

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "template_file" "script" {
  template = "${file("${path.module}/scripts/init.cfg")}"

  vars {
    project_name = "${var.ec2_project_name}"
  }
}

data "aws_security_group" "default" {
  vpc_id = "${var.vpc}"
  name   = "default"
}

resource "aws_instance" "ecs" {
  ami                         = "${data.aws_ami.amazon.id}"
  iam_instance_profile        = "${var.ec2_role}"
  instance_type               = "${var.ec2_type}"
  key_name                    = "${var.ec2_key_pair}"
  subnet_id                   = "${count.index % 2 == 0 ? var.ec2_subnet_id_a : var.ec2_subnet_id_b}"
  vpc_security_group_ids      = ["${data.aws_security_group.default.id}"]
  user_data                   = "${data.template_file.script.rendered}"
  ebs_optimized               = true
  associate_public_ip_address = false

  root_block_device = {
    volume_size = "${var.ec2_disk_size}"
  }

  tags {
    Name = "${var.ec2_project_name} - ecsInstance"
  }

  count = "${var.ec2_count}"
}
