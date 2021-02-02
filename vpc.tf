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

resource "aws_route_table" "route-table-public" {
  vpc_id = aws_vpc.landing-zone.id

  tags = {
    "Name"  = "route-table-public-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_route" "route-internet-gateway" {
  route_table_id         = aws_route_table.route-table-public.id
  gateway_id             = aws_internet_gateway.gw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "route-table-public-a" {
  subnet_id      = aws_subnet.int-public-subnet-AZa.id
  route_table_id = aws_route_table.route-table-public.id
}

resource "aws_route_table_association" "route-table-public-b" {
  subnet_id      = aws_subnet.int-public-subnet-AZb.id
  route_table_id = aws_route_table.route-table-public.id
}