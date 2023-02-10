data "aws_security_group" "ashu-sg" {
    id = "sg-0cecdd3b9f665d912"
}

data "aws_security_group" "ashu-sg1" {
    id = "sg-0c46398c65521c995"
}


resource "aws_instance" "ashu-obj" {
  ami             = "ami-01a4f99c4ac11b03c"
  instance_type   = "t2.micro"
  key_name        = "hellokey" # using existing key 
  vpc_security_group_ids = [data.aws_security_group.ashu-sg.id,data.aws_security_group.ashu-sg1.id]
  tags = {
    "Name" = "linux-vm-terraform"
  }


}
