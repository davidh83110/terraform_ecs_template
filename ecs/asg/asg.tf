## EC2
data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["amazon"]

  name_regex = "^amzn-ami-.*-amazon-ecs-optimized$"

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_security_group" "default" {
  vpc_id = "${var.vpc}"
  name   = "default"
}

## from ec2 folder
data "template_file" "script" {
  template = "${file("${path.module}/../ec2/scripts/init.cfg")}"

  vars {
    project_name = "${var.asg_project_name}"
  }
}

resource "aws_launch_configuration" "asg" {
  name_prefix          = "${var.asg_project_name}-asg-configuration"
  image_id             = "${data.aws_ami.amazon.id}"
  instance_type        = "${var.asg_instance_type}"
  enable_monitoring    = false
  key_name             = "${var.asg_ec2_key}"
  iam_instance_profile = "${var.asg_instance_profile}"
  security_groups      = ["${data.aws_security_group.default.id}"]
  user_data            = "${data.template_file.script.rendered}"

  root_block_device = {
    volume_size = 100
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = ["name_prefix", "image_id"]
  }
}

resource "aws_autoscaling_group" "asg" {
  name                 = "${var.asg_project_name}-asg"
  vpc_zone_identifier  = ["${var.asg_subnet_id_a}", "${var.asg_subnet_id_b}"]
  launch_configuration = "${aws_launch_configuration.asg.name}"
  min_size             = "${var.asg_min_size}"
  max_size             = "${var.asg_max_size}"
  enabled_metrics      = ["GroupStandbyInstances", "GroupTotalInstances", "GroupPendingInstances", "GroupTerminatingInstances", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupMinSize", "GroupMaxSize"]

  tag {
    key                 = "Name"
    value               = "${var.asg_project_name} - ecsInstance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = ["min_size", "max_size"]
  }
}
