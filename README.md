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

Launch instance: 
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
 
File upload: provisioner "file"{...} added to instance;   

- Upload public key to AWS: resource "aws_key_pair" ""{...} 

Use private key to login: connection{} 

After uploading a script: execute 
- remote-exec 

After provisioner script is run via terraform apply, visit host IP in browser; 


#### AWS Security Group (firewall/iptables in linux)
Allow access from local IP to instance 
- inbound rule: ALLOW all TCP traffic type from [source.ip]/32 ; 


#### Output 
Use output{} to display public IP of an AWS resource; 

provisioner "local-exec" {}: 
- can be used to collect and store private IPs of all instances 
launched, and use that to start automation following provisioning; 
- can populate an Ansible host file with these IP addresses and then use playbook to provision 
software on those hosts; 
- can execute a script with attributes as arguments, which will take care of a mapping of resource 
names and IP addresses;  


#### State 

Terraform keeps remote state of infrastructure 
- terraform.tfstate (JSON)
- terraform.tfstate.backup (backup of the provision state) 

New state file and backup are created by running terraform apply; 
Ok to keep them in version control (git);

The larger the project, store state remotely (rather than locally) using the 
 backend functionality: 
 - local backup 

Other backends: (not all remote stores have locking)
- s3 (w/ a locking mechanism using dynamoDB) 
- consul (w/ locking) 
- terraform enterprise (commercial solution) 

Locking prevents conflicts by allowing only 1 party 
to update the state at the same time; 

For [enabling] remote operations: enhanced backends 
(see: https://www.terraform.io/docs/backends/types/index.html) 

Configuring a remote state: 
1. add backend code to a *.tf file 
2. run initialization 

When using s3, best to configure AWS creds using AWS commandline utility 
- $ aws configure  
(backend code needs access to AWS s3 before it does any other initialization) 
- $ terraform init 
(this will then initialize the backend) 

Remote store of terraform state helps avoid having to commit and push 
terraform.tfstate to git; 

read-only remote stores can be specified directly in *.tf file; 


#### Data sources 

dynamic information 
- accessible via their API 
- exposed in structured format via data sources 

AMIs list 

Availability zones list 

Filter on incoming/outgoing traffic using security groups on: 
- IP range 
- port 
- protocol (TCP, UDP, ICMP, etc)



Note: store .aws/credentials file locally; 

securitygroup.tf 


#### Template providers 
Helps create customized config files 

resource attributes (ie: public IP) 
create variable based on terraform resource attributes 
build templates based on these variables 

result = string (can be used in other variables) 
[This] string contains a template (ie: config file) 
Can be used to create 
* generic templates 
* cloud init configs 

Create a template file

Create a script that uses that template file 


#### Reminders 

10.0.x.x  <>  10.0.0.0/16 

10.x.x.x  <>  10.0.0.0/8 

172.16.0.0/12 = range(172.16.0.0, 172.31.255.255)

###### Subnets 

###### Subnet masks 


Note: every availability zone has it's own private and public subnets; 

All public subnets are connected to an internet Gateway; 

NAT Gateways allow private instances to communicate with the outside 
but not from outside to inside; 

vpc.td 

nat.tf 




























