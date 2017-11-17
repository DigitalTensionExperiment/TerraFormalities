
// Send AWS key pair to
resource "aws_key_pair" "terrakey" {
  key_name = "terrakey"
  public_key = "${file(${var.PATH_TO_PUBLIC_KEY})}"
}

resource "aws_instance" "box001" {

  // security group not being specified (for now)
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}" //"ami-27fd535d"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.terrakey.key_name}"

  // connection{} is using ssh: connects to host on which script.sh will be run:
  provisioner "file" {
    source = "script.sh"
    destination = "/opt/script.sh"
    connection {
      user = "${var.INSTANCE_USERNAME}"
      private_key = "${file(${var.PATH_TO_PRIVATE_KEY})}"
    }
  }

  // This command will be executed locally: (linux/mac)
  provisioner "local-exec" {
    command = "echo ${aws_instance.box001.private_ip} >> privateIPlist.txt"
  }

  //
  provisioner "remote-exec" {
    inline = [
      "chmod +x /opt/script.sh",
      "/opt/script.sh arguments"
    ]
  }
}


output "ip" {
  value = "${aws_instance.box001.public_ip}"
}







