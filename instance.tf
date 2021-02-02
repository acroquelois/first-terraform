resource "aws_instance" "instances-gif-all-a1" {
  instance_type = var.instance-type
  ami = var.ami-ID
  subnet_id = aws_subnet.int-private-subnet-AZa.id
  vpc_security_group_ids = [aws_security_group.instances-sg.id]

  tags = {
    "Name"  = "instance-a1-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_instance" "instances-gif-all-a2" {
  instance_type = var.instance-type
  ami = var.ami-ID
  subnet_id = aws_subnet.int-private-subnet-AZa.id
  vpc_security_group_ids = [aws_security_group.instances-sg.id]

  tags = {
    "Name"  = "instance-a2-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_instance" "instances-gif-all-b1" {
  instance_type = var.instance-type
  ami = var.ami-ID
  subnet_id = aws_subnet.int-private-subnet-AZb.id
  vpc_security_group_ids = [aws_security_group.instances-sg.id]

  tags = {
    "Name"  = "instance-b1-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_instance" "instances-gif-all-b2" {
  instance_type = var.instance-type
  ami = var.ami-ID
  subnet_id = aws_subnet.int-private-subnet-AZb.id
  vpc_security_group_ids = [aws_security_group.instances-sg.id]

  tags = {
    "Name"  = "instance-b2-${var.owner}"
    "Owner" = var.owner
  }
}