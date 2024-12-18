// main.tf
provider "aws" {
  region = "eu-north-1"
}

module "vpc" {
  source = "./vpc"
}

module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.main.id
}

module "ec2" {
  source = "./ec2"
  public_subnet_id = module.subnets.public.id
  private_subnet_id = module.subnets.private.id
}
