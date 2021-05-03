provider "aws" {
    region = "us-east-2" 
}

module "ec2Module" {
  source = "./ec2"
  ec2name = "Name From Module"
}

output "ec2id" {
    value = module.ec2Module.ec2id
}