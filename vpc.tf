resource "aws_vpc" "landing-zone" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name"  = "vpc-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.landing-zone.id

  tags = {
    "Name"  = "gw-${var.owner}"
    "Owner" = var.owner
  }
}