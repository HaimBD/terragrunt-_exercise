variable "vpc_name" {type = string}
variable "vpc_cidr"            { type = string }
variable "azs"                 { type = list(string) }
variable "vpc_private_subnets" { type = list(string) }

