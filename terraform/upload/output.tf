output "myout1" {
    value = "my Install private IP address is ${aws_instance.creating-vm.private_ip}"
}

output "myout2" {
    value = "my public IP address is  ${aws_instance.creating-vm.public_ip}"
    sensitive = true 
}