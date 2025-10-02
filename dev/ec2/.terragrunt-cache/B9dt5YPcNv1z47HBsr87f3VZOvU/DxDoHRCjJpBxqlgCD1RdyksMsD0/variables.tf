variable "ami" {}
variable "instance_type" {}
variable "subnet_id"               { type = string }
variable "vpc_id"                  { type = string }
variable "vpc_security_group_ids" {
    type = list(string)
    default = []
}

