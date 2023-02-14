variable "aws-image" {
  description = "this will store amazon ami image"
  type = string 
  default = "ami-01a4f99c4ac11b03c"
}

variable "aws-type" {
    description = "resoruce type in aws "
    type = string 
    default = "t2.micro"
  
}

variable "instance-number" {
    description = " number of vm"
    type = number 
    default = 1
  
}

variable "eip" {
  description = "need fix public IP "
  type = bool 
  default = true 
}