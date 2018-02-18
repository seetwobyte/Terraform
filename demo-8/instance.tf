resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  monitoring = true
  count = 2
  # the VPC subnet
  subnet_id = "${aws_subnet.web-a.id}"
  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"
  tags {
    Name = "example1A"
  }

}

resource "aws_instance" "remote_access" {
  ami = "${lookup(var.AMIS, var.AWS_REGION )}"
  instance_type = "t2.micro"
  monitoring = false
  count = 1
  subnet_id = "${aws_subnet.public-a.id}"
  vpc_security_group_ids = [
    "${aws_security_group.allow-ssh.id}"]
  key_name = "${aws_key_pair.mykeypair.key_name}"

  tags {
    Name = "remote"
  }
}





