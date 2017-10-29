# nat gw
resource "aws_eip" "nat" {
  vpc      = true
}
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.web-tier-a.id}"
  subnet_id = "${aws_subnet.web-tier-b.id}"
  depends_on = ["aws_internet_gateway.main-gw"]
}

# VPC setup for NAT
resource "aws_route_table" "main-private" {
    vpc_id = "${aws_vpc.bancroft.id}"
    route {
        cidr_block = "X.X.X.X/X"
        nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
    }

    tags {
        Name = "main-private-1"
    }
}
# route associations private
resource "aws_route_table_association" "main-private-1-a" {
    subnet_id = "${aws_subnet.web-tier-a.id}"
    route_table_id = "${aws_route_table.main-private.id}"
}
resource "aws_route_table_association" "main-private-2-a" {
    subnet_id = "${aws_subnet.main-private-2.id}"
    route_table_id = "${aws_route_table.main-private.id}"
}
resource "aws_route_table_association" "main-private-3-a" {
    subnet_id = "${aws_subnet.main-private-3.id}"
    route_table_id = "${aws_route_table.main-private.id}"
}
