# TerraFormalities

Find AMI ID's here:
https://cloud-images.ubuntu.com/locator/ec2/


0. Remove *.tfvars
1. run: # terraform plan

^ will ask for ACCESS_KEY and SECRET_KEY: 
>(Adding *.tfvars to gitignore makes it think the file is gone; 
Hiding it in gitignore is a lousy technique for multiple reasons;)   

Providing wrong values: 
>  Error: Error asking for user input: 
  Error parsing address 'aws_key_pair': invalid resource address "aws_key_pair"


#### Commands basics 

$ terraform init 

$ terraform plan 

Apply the output file b/c it contains the changes that will be made 

$ terraform plan -out output.file 

$ terraform apply output.file 

$ terraform plan -out output.file ; terraform apply output.file ; rm output.file 

$ terraform apply 

$ terraform destroy 

#### File upload: 
 
  provisioner "file" {
    source = "app.conf"
    destination = "/etc/app.conf"
    connection {
      user = ""
      private_key = ""
    }
  }
  
  

#### Provisioning software  
- file upload: provisioner "file"{...} added to instance;   


Upload public key to AWS: resource "aws_key_pair" ""{...} 

Use private key to login: connection{} 

After uploading a script: execute 
- remote-exec 