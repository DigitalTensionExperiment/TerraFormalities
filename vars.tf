variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {

  // There's gotta be a lookup() for var.AMIS in instance:
  type = "map"
  // lookup() will need second param of var.AWS_REGION specified above, default defined below:
  default = {
    us-east-1 = "ami-27fd535d"
  }
}

// $ ssh-keygen -f terrakey

variable "PATH_TO_PRIVATE_KEY" {
  default = "terrakey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "terrakey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "terrantula"
}

