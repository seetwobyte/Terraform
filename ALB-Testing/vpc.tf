# Building out the VPC

resource "aws_vpc" "Bancroft_Group" {
  cidr_block = "10.10.0.0/20"
  enable_dns_hostnames = "true"
    tags {
      Name = "Bancroft_Group_VPC"
    }

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
resource "aws_route_table_association" "main" {
  route_table_id = "${aws_route_table.rtb.id}"
  subnet_id = "${aws_subnet.pub_subnet_1.id}"
  subnet_id = "${aws_subnet.pub_subnet_2.id}"
}

# Subnets

resource "aws_subnet" "pub_subnet_1" {
  cidr_block = "10.10.0.0/25"
  vpc_id = "${aws_vpc.Bancroft_Group.id}"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1a"

    tags {
      Name = "PUBLIC_SUBNET"

    }
}
resource "aws_subnet" "pub_subnet_2" {
  cidr_block = "10.10.0.128/25"
  vpc_id = "${aws_vpc.Bancroft_Group.id}"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1b"

tags {
  Name = "PUBLIC_SUBNET"
}
}
resource "aws_subnet" "web_subnet_1" {
  cidr_block = "10.10.0.0/25"
  vpc_id = "${aws_vpc.Bancroft_Group.id}"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1a"

    tags {
      Name = "Web_subnet1"

    }
}
resource "aws_subnet" "web_subnet_2" {
  cidr_block = "10.10.0.128/25"
  vpc_id = "${aws_vpc.Bancroft_Group.id}"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1b"

tags {
  Name = "web_submet2"
}
}
