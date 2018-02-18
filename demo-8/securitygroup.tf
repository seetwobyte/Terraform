resource "aws_security_group" "allow-ssh" {
  vpc_id = "${aws_vpc.bancroft.id}"
  name = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["196.52.2.46/32"]
  } 
tags {
    Name = "allow-ssh"
  }
}

resource "aws_security_group" "Remote-access" {
  vpc_id = "${aws_vpc.bancroft.id}"
  name = "Remote-access"
  description = "access to Bastion host"
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
 ingress {
    from_port = 0
    protocol = "tcp"
    to_port = 0
    cidr_blocks = ["73.80.50.68/32"]

   from_port = 0
   protocol = "tcp"
   to_port = 443
   cidr_blocks = ["10.10.0.0/16"]
  }

}
resource "aws_security_group" "webServer-SG" {
  vpc_id = "${aws_vpc.bancroft.id}"
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
  ingress {
    from_port = 0
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]

    from_port = 0
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]

    from_port = 0
    protocol = "ssh"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "privateSG" {
  vpc_id = "${aws_vpc.bancroft.id}"
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
  ingress {
    from_port = 0
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["10.10.0.0/16"]

    from_port = 0
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["10.10.0.0/24"]

    from_port = 0
    protocol = "ssh"
    to_port = 22
    cidr_blocks = ["10.10.0.0/24"]
  }
}
resource "aws_security_group" "public-SG" {
  vpc_id = "${aws_vpc.bancroft.id}"
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    }
  ingress {
    from_port = 0
    protocol = "http"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]

    from_port = 0
    protocol = "ssh"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]

    from_port = 0
    protocol = "https"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "SophosUTM-SG" {
  vpc_id = "${aws_vpc.bancroft.id}"
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
  ingress {
    from_port = 0
    protocol = "tcp"
    to_port = 4444
    cidr_blocks = [
      "0.0.0.0/0"]

    from_port = 0
    protocol = "ssh"
    to_port = 22
    cidr_blocks = [
      "0.0.0.0/0"]

    from_port = 0
    protocol = "https"
    to_port = 443
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}
resource "aws_security_group" "Bastion_Host" {
  vpc_id = "${aws_vpc.bancroft.id}"
  name = "Bastion_Host"
  description = "Public entry Security Group"

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
  }

    ingress {
    from_port = 0
    protocol = "ssh"
    to_port = 22
    cidr_blocks = [
      "196.52.2.103"]
  }
  }
