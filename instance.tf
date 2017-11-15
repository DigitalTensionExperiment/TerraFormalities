resource "aws_instance" "box001" {
  ami           = "ami-27fd535d"
  instance_type = "t2.micro"
}
