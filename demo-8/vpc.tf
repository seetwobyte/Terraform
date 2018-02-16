# Internet VPC
resource "aws_vpc" "bancroft" {
    cidr_block = "10.10.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "bancroft"
    }
}


# Subnets
resource "aws_subnet" "public-a" {
    vpc_id = "${aws_vpc.bancroft.id}"
    cidr_block = "10.10.1.0/25"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1a"

    tags {
        Name = "public-a"
    }
}
resource "aws_subnet" "public-b" {
    vpc_id = "${aws_vpc.bancroft.id}"
    cidr_block = "10.10.1.128/25"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1b"

    tags {
        Name = "public-b"


    }
}
resource "aws_subnet" "web-a" {
    vpc_id = "${aws_vpc.bancroft.id}"
    cidr_block = "10.10.2.0/25"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1a"

    tags {
        Name = "web-a"
    }
}
resource "aws_subnet" "web-b" {
    vpc_id = "${aws_vpc.bancroft.id}"
    cidr_block = "10.10.2.128/25"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1b"

    tags {
        Name = "web-b"
    }
}
resource "aws_subnet" "data-a" {
    vpc_id = "${aws_vpc.bancroft.id}"
    cidr_block = "10.10.3.0/25"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1a"

    tags {
        Name = "data-a"
    }
}
resource "aws_subnet" "data-b" {
    vpc_id = "${aws_vpc.bancroft.id}"
    cidr_block = "10.10.3.128/25"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1b"

    tags {
        Name = "data-b"
    }
}

resource "aws_subnet" "private-a" {
  vpc_id = "${aws_vpc.bancroft.id}"
  cidr_block = "10.10.4.0/25"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1a"

  tags {
    Name = "private-a"

  }
}
resource "aws_subnet" "private-b" {
    vpc_id = "${aws_vpc.bancroft.id}"
    cidr_block = "10.10.4.128/25"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1b"

    tags {
        Name = "private-b"
    }
}

# Internet GW
resource "aws_internet_gateway" "bancroft-gw" {
    vpc_id = "${aws_vpc.bancroft.id}"

    tags {
        Name = "bancroft"
    }
}

# route tables
resource "aws_route_table" "main-public" {
    vpc_id = "${aws_vpc.bancroft.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.bancroft-gw.id}"
    }

    tags {
        Name = "main-public-1"
    }
}

# route associations public
resource "aws_route_table_association" "main-public-1-a" {
    subnet_id = "${aws_subnet.public-a.id}"
    subnet_id = "${aws_subnet.public-b.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}







#resource "aws_route_table_association" "main-public-2-a" {
 #   subnet_id = "${aws_subnet.web-a.id}"
  #  subnet_id = "${aws_subnet.web-b.id}"
   # subnet_id = "${aws_subnet.data-a.id}"
    #subnet_id = "${aws_subnet.data-b.id}"
    #route_table_id = "${aws_route_table.main-public.id}"


