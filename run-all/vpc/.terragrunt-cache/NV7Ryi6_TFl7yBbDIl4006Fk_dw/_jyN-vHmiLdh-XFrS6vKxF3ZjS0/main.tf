resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = { Name = var.vpc_name }
}

resource "aws_subnet" "private" {
  count                   = length(var.vpc_private_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.vpc_private_subnets[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = false
  tags = { Name = "${var.vpc_name}-private-${count.index + 1}" }
}

output "vpc_id" {
  value = aws_vpc.main.id
}
output "private_subnet_ids" {
  value = [for s in aws_subnet.private : s.id]
}

