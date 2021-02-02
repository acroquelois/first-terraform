resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gateway" {
  subnet_id     = aws_subnet.int-public-subnet-AZa.id
  allocation_id = aws_eip.nat_eip.id

  tags = {
    "Name"  = "nat-gateway-${var.owner}"
    "Owner" = var.owner
  }
}

resource "aws_route_table" "route-table-private" {
  vpc_id = aws_vpc.landing-zone.id

  tags = {
    "Name"  = "route-table-private-${var.owner}"
    "Owner" = var.owner
  }
}


resource "aws_route" "route-nat-gateway" {
  route_table_id         = aws_route_table.route-table-private.id
  nat_gateway_id         = aws_nat_gateway.nat-gateway.id
  destination_cidr_block = "0.0.0.0/0"
}


resource "aws_route_table_association" "route-table-private-a" {
  subnet_id      = aws_subnet.int-private-subnet-AZa.id
  route_table_id = aws_route_table.route-table-private.id
}

resource "aws_route_table_association" "route-table-private-b" {
  subnet_id      = aws_subnet.int-private-subnet-AZb.id
  route_table_id = aws_route_table.route-table-private.id
}