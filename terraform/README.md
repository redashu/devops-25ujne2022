## getting started with terraform

## Terraform installation 

### Link for docs 

[link_to_install](https://developer.hashicorp.com/terraform/downloads)

### verify after installation 

```
fire@ashutoshhs-MacBook-Air Desktop % terraform version 
Terraform v1.3.2
on darwin_amd64

Your version of Terraform is out of date! The latest version
is 1.3.7. You can update by downloading from https://www.terraform.io/downloads.html
fire@ashutoshhs-MacBook-Air Desktop % 
fire@ashutoshhs-MacBook-Air Desktop % terraform --version 
Terraform v1.3.2
on darwin_amd64

Your version of Terraform is out of date! The latest version
is 1.3.7. You can update by downloading from https://www.terraform.io/downloads.html
fire@ashutoshhs-MacBook-Air Desktop % 


```

### to provision resources in aws cloud -- we need cloud api credentials

### configure aws cred in your terraform machine --

```
fire@ashutoshhs-MacBook-Air Desktop % aws configure 
AWS Access Key ID [****************DMVI]:
AWS Secret Access Key [****************bLhG]: 
Default region name [us-east-1]: ap-south-1
Default output format [None]: 
fire@ashutoshhs-MacBook-Air Desktop % 

```

### creating ec2 instance 

### first tf script 

```
provider "aws" {
    region = "ap-south-1"
    access_key = "A"
    secret_key  = "Dwhcnxm"
}

resource "aws_instance" "ashuvm" {
    ami = "ami-01a4f99c4ac11b03c"
    instance_type =  "t2.micro"
    key_name =  "nikhil_training_keypair" # already existing 
  
}
```

### on the same location you run these command 

```
fire@ashutoshhs-MacBook-Air terraform % ls
awsvm.tf
```

### Init -- plan --apply 

```
terraform init 
terraform plan 
terraform apply 
```

### to destroy 

```
terraform destroy 
```


