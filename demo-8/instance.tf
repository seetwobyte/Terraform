# test

resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  monitoring = true
  count = 6
  # the VPC subnet
  subnet_id = "${aws_subnet.web-a.id}"
  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"
  tags {
    Name = "Linux1"
  }

}

resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  monitoring = true
  count = 1
  # the VPC subnet
  subnet_id = "${aws_subnet.web-a.id}"
  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"
  tags {
    Name = "Linux2"
  }

}

resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  monitoring = true
  count = 1
  # the VPC subnet
  subnet_id = "${aws_subnet.web-a.id}"
  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"
  tags {
    Name = "Linux3"
  }

}




resource "aws_instance" "remote_access" {
  ami = "${lookup(var.AMIS, var.AWS_REGION )}"
  instance_type = "t2.micro"
  monitoring = false
  count = 4
  subnet_id = "${aws_subnet.public-a.id}"
  vpc_security_group_ids = [
    "${aws_security_group.allow-ssh.id}"]
  key_name = "${aws_key_pair.mykeypair.key_name}"

  tags {
    Name = "remote"
  }
}





