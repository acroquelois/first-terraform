resource "aws_instance" "instances-gif-all" {
  instance_type = var.instance-type
  ami = var.ami-ID

  tags = {
    "Name"  = "instance-${var.owner}"
    "Owner" = var.owner
  }
}