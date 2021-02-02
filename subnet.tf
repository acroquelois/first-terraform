resource "aws_subnet" "int-private-subnet-AZa" {
  vpc_id            = aws_vpc.landing-zone.id
  availability_zone = "eu-west-1a"
  cidr_block        = "10.0.0.0/24"

  tags = {
    "Name"  = "public-subnet-a-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_subnet" "int-private-subnet-AZb" {
  vpc_id            = aws_vpc.landing-zone.id
  availability_zone = "eu-west-1b"
  cidr_block        = "10.0.1.0/24"

  tags = {
    "Name"  = "public-subnet-b-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_subnet" "int-public-subnet-AZa" {
  vpc_id            = aws_vpc.landing-zone.id
  availability_zone = "eu-west-1a"
  cidr_block        = "10.0.2.0/24"

  tags = {
    "Name"  = "private-subnet-a-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_subnet" "int-public-subnet-AZb" {
  vpc_id            = aws_vpc.landing-zone.id
  availability_zone = "eu-west-1b"
  cidr_block        = "10.0.3.0/24"

  tags = {
    "Name"  = "private-subnet-b-${var.owner}"
    "Owner" = var.owner
  }
}