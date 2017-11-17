


# s3:
terraform {
  backend "s3" {
    bucket = "bucket001"
    key = "" # directory in s3
    region = "us-east-1"
  }
}

# consul:
terraform {
  backend "consul" {
    # hostname of consul cluster:
    address = "demo.consul.io"
    # path where in the consul cluster the state will be stored:
    path = ""
  }
}




