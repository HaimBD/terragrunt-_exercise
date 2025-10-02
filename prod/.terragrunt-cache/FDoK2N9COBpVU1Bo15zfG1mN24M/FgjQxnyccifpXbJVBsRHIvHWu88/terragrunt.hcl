include {
  path = find_in_parent_folders()
}

terraform {
  source = "./module-ec2"
}

locals {
    environment = "prod"
    instance_type = local.environment == "prod" ? "t3.medium" : "t3.micro"
    }

inputs = {
  ami           = "ami-0360c520857e3138f"
  instance_type = local.instance_type
  environment = local.environment
}