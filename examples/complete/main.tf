provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "a3linux/tagged-vpc/aws"

  vpc_name = "vpc-name"
}

module "subnets" {
  source = "a3linux/tagged-subnets/aws"

  vpc_id = module.vpc.vpc_id
  name = "subnet-name"
}

output "subnets" {
  value = module.subnets
}
