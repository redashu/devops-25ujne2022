resource  "aws_instance"  "creating-vm" {
    ami = var.aws-image
    instance_type = var.aws-type 
    #count = var.instance-number 
    associate_public_ip_address = var.eip
    provisioner "local-exec" {
      command = "echo hello world  >>/tmp/time.txt"
      when = destroy
    }
    provisioner "local-exec" {
      
    }
}