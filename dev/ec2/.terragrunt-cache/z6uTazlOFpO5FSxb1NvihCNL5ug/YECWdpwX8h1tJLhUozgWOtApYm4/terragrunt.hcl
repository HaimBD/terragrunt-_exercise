include {
  path = find_in_parent_folders()
}

terraform {
  source = "./module-ec2"
}

locals {
    environment = "dev"
    instance_type = local.environment == "dev" ? "t3.medium" : "t3.micro"
    }

inputs = {
  ami           = "ami-0360c520857e3138f"
  instance_type = local.instance_type
  environment = local.environment
}







