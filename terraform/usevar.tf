data "aws_security_group" "ashu-sg" {
  id = "sg-0cecdd3b9f665d912"
}

data "aws_security_group" "ashu-sg1" {
  id = "sg-0c46398c65521c995"
}



resource "aws_instance" "ashu-obj" {
  ami                         = var.ashu-var # ami call 
  instance_type               = var.ashu-var9
  key_name                    = "hellokey"    # using existing key 
  count                       = var.ashu-var1 # count of instance
  associate_public_ip_address = var.ashu-var2 # bool call 
  vpc_security_group_ids      = [data.aws_security_group.ashu-sg.id, data.aws_security_group.ashu-sg1.id]
  tags = {
    "Name" = "linux-vm-terraform"
  }


}
