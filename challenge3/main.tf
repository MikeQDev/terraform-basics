provider "aws" {
    region = "us-east-2" 
}

# 2 EC2
module "webModule" {
  source = "./ec2"
  instanceType = "t2.large"
  securityGroups = [module.sgModule.sgName]
  instanceNames = ["webInstanceA", "webInstanceB"]
}

module "dbModule" {
    source = "./ec2"   
    instanceNames = ["dbInstance"]
}
// move this inside ec2 
module "sgModule" {
  source = "./sg"
  sgName = "secGroup"
  ports = [80, 443, 3306]
}