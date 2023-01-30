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


