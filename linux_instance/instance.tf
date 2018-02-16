
resource "aws_instance" "linux" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  count = 1

  # the VPC subnet
  subnet_id = "${aws_subnet.public-a.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"
  tags {
    Name = "linux_Jump_Box"
  }

}


