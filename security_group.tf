resource "aws_security_group" "ec2_a" {
  provider = "aws.tokyo"
  name     = "ec2_a"
  vpc_id   = "${module.vpc_a.vpc_id}"
}

resource "aws_security_group_rule" "ec2_a-from_office" {
  provider    = "aws.tokyo"
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["${var.officeip}"]

  security_group_id = "${aws_security_group.ec2_a.id}"
}

resource "aws_security_group_rule" "ec2_a-egress" {
  provider    = "aws.tokyo"
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.ec2_a.id}"
}

resource "aws_security_group" "ec2_b" {
  provider = "aws.singapore"
  name     = "ec2_b"
  vpc_id   = "${module.vpc_b.vpc_id}"
}

resource "aws_security_group_rule" "ec2_b-from_office" {
  provider    = "aws.singapore"
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["${var.officeip}"]

  security_group_id = "${aws_security_group.ec2_b.id}"
}

resource "aws_security_group_rule" "ec2_b-egress" {
  provider    = "aws.singapore"
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.ec2_b.id}"
}
