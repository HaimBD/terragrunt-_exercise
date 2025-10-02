include {
  path = find_in_parent_folders()
}

terraform {
  source = "./module-s3"
}

inputs = {
  bucket_name = "terragrunt-s3-runall",
  acl_status = "private"
}
