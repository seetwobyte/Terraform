resource "aws_security_group" "allow_ssh" {
  vpc_id = "${aws_vpc.Bancroft_Group.id}"
  name = "allow_ssh"
  description = " Allow SSH"

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["196.52.2.76/32"]
  }
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "Internal-SG" {
  vpc_id = "${aws_vpc.Bancroft_Group.id}"
  name = "Inernal-SG"
  description = "Internal-SG"

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["10.10.0.0/24"]

  }
}

resource "aws_security_group" "Bastion_host" {
  vpc_id = "${aws_vpc.Bancroft_Group.id}"
  name = "bastion_host"
  description = "Bastion_host"

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["196.52.2.76/32"]
  }
  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["192.52.2.76/32"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

}