provider "aws" {
    region = "us-east-1" 
}

resource "aws_vpc" "myVpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
      Name = var.vpcname
  }
}

variable "vpcname" {
    type = string
    default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "myList" {
    type = list(string)
    default = ["Value1","Value2"]
}

variable "mymap" {
    type = map
    default = {
        Key1 = "Value1"
        Key2 = "Value2"
    }
}


output "vpcid" {
    value = aws_vpc.myVpc.id
}


variable "mytuple"{
    type = tuple([string, number, string])
    default = ["cat",1,"dog"]
}

variable "myobject" {
    type = object({name = string, port = list(number)})
    default = {
        name = "NAME"
        port = [22,25,80]
    }
}