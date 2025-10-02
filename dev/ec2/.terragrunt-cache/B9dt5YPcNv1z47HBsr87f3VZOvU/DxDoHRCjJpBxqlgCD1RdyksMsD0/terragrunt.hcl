include {
  path = find_in_parent_folders()
}

terraform {
  source = "./module-ec2"
}


dependency "vpc" {
  config_path = "../vpc"


  mock_outputs = {
    vpc_id               = "vpc-00000000000000000"
    private_subnet_ids   = ["subnet-00000000000000001"]
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

inputs = {
  ami           = "ami-0360c520857e3138f"
  instance_type = "t2.micro"
  subnet_id = dependency.vpc.outputs.private_subnet_ids[0]
  vpc_id = dependency.vpc.outputs.vpc_id
}



