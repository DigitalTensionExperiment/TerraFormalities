# TerraFormalities

Find AMI ID's here:
https://cloud-images.ubuntu.com/locator/ec2/


lookup() in instance >> create a "map" variable in vars ;


0. Remove *.tfvars
1. run: # terraform plan

^ will ask for ACCESS_KEY and SECRET_KEY ;
(Adding *.tfvars to gitignore makes it think the file is gone; 
Hiding it in gitignore is a lousy technique for multiple reasons;)   

** Providing wrong values gives InvalidClientToken error;  

## Provisioning software  
- file upload: provisioner "file"{...} added to instance;   


Upload public key to AWS: resource "aws_key_pair" ""{...} 

Use private key to login: connection{} 

After uploading a script: execute 
- remote-exec 