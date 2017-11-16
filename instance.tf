resource "aws_key_pair" "" {
  key_name = ""
  public_key = ""
}

resource "aws_instance" "box001" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  provisioner "file" {
    source = "script.sh"
    destination = "/opt/script.sh"
    connection {
      user = "${var.instance_username}"
      private_key = "${file(${var.path_to_private_key})}"
    }
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /opt/script.sh",
      "/opt/script.sh arguments"
    ]
  }
}


