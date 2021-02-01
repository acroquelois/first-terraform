resource "aws_security_group" "lb-sg" {
  name        = "int-lb-sg"
  description = "Load balancer security group"
  vpc_id      = aws_vpc.landing-zone.id

  tags = {
    "Name"  = "sg-lb-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_security_group" "instances-sg" {
  description = "Instance security group"
  name        = "int-webserver-sg"
  vpc_id      = aws_vpc.landing-zone.id

  tags = {
    "Name"  = "sg-instance-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_security_group_rule" "ingress-all-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [0.0.0.0/0]
  security_group_id = aws_security_group.lb-sg.id
}

resource "aws_security_group_rule" "egress-http-from-instances" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = aws_security_group.instances-sg.id
  security_group_id = aws_security_group.lb-sg.id
}

resource "aws_security_group_rule" "ingress-all-http-from-lb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = aws_security_group.lb-sg.id
  security_group_id = aws_security_group.instances-sg.id
}

resource "aws_security_group_rule" "egress-http-from-instances" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [0.0.0.0/0]
  security_group_id = aws_security_group.instances-sg.id
}