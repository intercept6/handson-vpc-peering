data "aws_ami" "ec2_a-amazon_linux" {
  provider    = "aws.tokyo"
  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

data "aws_ami" "ec2_b-amazon_linux" {
  provider    = "aws.singapore"
  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

resource "aws_key_pair" "ec2_a" {
  provider   = "aws.tokyo"
  key_name   = "ec2_a"
  public_key = "${var.publickey}"
}

resource "aws_key_pair" "ec2_b" {
  provider   = "aws.singapore"
  key_name   = "ec2_b"
  public_key = "${var.publickey}"
}

module "ec2_a" {
  providers = {
    aws = "aws.tokyo"
  }

  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  name                        = "ec2_a"
  ami                         = "${data.aws_ami.ec2_a-amazon_linux.id}"
  key_name                    = "${aws_key_pair.ec2_a.key_name}"
  instance_type               = "t2.nano"
  subnet_id                   = "${element(module.vpc_a.public_subnets, 0)}"
  vpc_security_group_ids      = ["${aws_security_group.ec2_a.id}"]
  associate_public_ip_address = true
}

module "ec2_b" {
  providers = {
    aws = "aws.singapore"
  }

  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  name                        = "ec2_b"
  ami                         = "${data.aws_ami.ec2_b-amazon_linux.id}"
  key_name                    = "${aws_key_pair.ec2_b.key_name}"
  instance_type               = "t2.nano"
  subnet_id                   = "${element(module.vpc_b.public_subnets, 0)}"
  vpc_security_group_ids      = ["${aws_security_group.ec2_b.id}"]
  associate_public_ip_address = true
}
