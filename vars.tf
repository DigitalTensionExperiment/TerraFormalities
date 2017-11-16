variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {

  // There's gotta be a lookup() for var.AMIS in instance:
  type = "map"

  default = {
    us-east-1 = "ami-27fd535d"
  }
}