module "vpc_a" {
  providers = {
    aws = "aws.tokyo"
  }

  source  = "github.com/terraform-aws-modules/terraform-aws-vpc"
  version = "v1.33.0"

  name = "vpc_a"

  cidr = "10.0.0.0/16"

  azs            = ["ap-northeast-1a"]
  public_subnets = ["10.0.0.0/24"]

  tags = {
    DeployBy    = "Terraform"
    Environment = "${terraform.workspace}"
    Project     = "Blog VPC Peering"
  }
}

module "vpc_b" {
  providers = {
    aws = "aws.singapore"
  }

  source  = "github.com/terraform-aws-modules/terraform-aws-vpc"
  version = "v1.33.0"

  name = "vpc_b"

  cidr = "10.1.0.0/16"

  azs            = ["ap-southeast-1a"]
  public_subnets = ["10.1.0.0/24"]

  tags = {
    DeployBy    = "Terraform"
    Environment = "${terraform.workspace}"
    Project     = "Blog VPC Peering"
  }
}
