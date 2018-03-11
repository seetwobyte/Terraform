# test

resource "aws_instance" "Nginx-1" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  monitoring = true
  count = 1
  # the VPC subnet
  subnet_id = "${aws_subnet.pub_subnet_1.id}"
  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  # the public SSH key
  key_name = "${aws_key_pair.linux1.key_name}"
    tags {
      Name = "NGINX-1"
    }

  }

resource "aws_instance" "Nginx-2" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  monitoring = true
  count = 1
  # the VPC subnet
  subnet_id = "${aws_subnet.pub_subnet_2.id}"
  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  # the public SSH key
  key_name = "${aws_key_pair.linux1.key_name}"
    tags {
      Name = "NGINX-2"
    }

  }
resource "aws_instance" "Bastion_Host" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  monitoring = true
  count = 1
  subnet_id = "${aws_subnet.pub_subnet_1.id}"
  vpc_security_group_ids = ["${aws_security_group.Bastion_host.id}"]
  key_name = "${aws_key_pair.linux1.key_name}"
  tags {
    Name = "Bastion_Host"
  }
}

/*
  provisioner "remote-exec" {
    inline = [
    "sudo yum install nginx -y",
    "sudo service anginx start",
    ]
  }
  tags {
    Name = "Nginx-1"
  }

}

/*resource "aws_instance" "nginx-2" {
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
  subnet_id = "${aws_subnet.pub_subnet_1}"
  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
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


*/
