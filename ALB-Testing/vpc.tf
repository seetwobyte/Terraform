# Building out the VPC

resource "aws_vpc" "Bancroft_Group" {
  cidr_block = "10.20.30.0/20"
  enable_dns_hostnames = "true"

}

# Internet Gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = "${aws_vpc.Bancroft_Group.id}"
}

# Route tables
resource "aws_route_table" "rtb" {
  vpc_id = "${aws_vpc.Bancroft_Group.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.IGW.id}"
  }
}

# route table association
resource "aws_route_table_association" "" {
  route_table_id = "${aws_route_table.rtb.id}"
  subnet_id = ""
}
