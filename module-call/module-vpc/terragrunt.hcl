include {
  path = find_in_parent_folders()
}

terraform {

  source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=v5.8.1"
}

locals {
  name = "hbd-vpc-module"
  azs = ["us-east-1a", "us-east-1b"]
  cidr            = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24",   "10.0.2.0/24"]
}

inputs = {
  name            = local.name
  cidr            = local.cidr
  azs             = local.azs
  private_subnets = local.private_subnets
}
