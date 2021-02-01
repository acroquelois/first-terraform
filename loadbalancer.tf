resource "aws_elb" "lb" {
  security_groups = [aws_security_group.lb-sg.id]

  subnets = [
    aws_subnet.int-public-subnet-AZa.id,
    aws_subnet.int-public-subnet-AZb.id
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 10
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing = true
  connection_draining       = true

  tags = {
    "Name"  = "lb-${var.owner}"
    "Owner" = var.owner
  }
}