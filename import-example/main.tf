provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpcA" {
  cidr_block = "10.0.0.0/16"
}

// Assume we already have a VPC created, vpc-0343a9b252209efa5
// We can leverage this VPC by importing it: `terraform import aws_vpc.vpcB vpc-0343a9b252209efa5`
// This will assign vpc-0343a9b252209efa5 to aws_vpc.vpcB in our TF state
resource "aws_vpc" "vpcB" {
  cidr_block = "192.168.0.0/24"
}