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

resource "aws_instance" "example-b" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  monitoring = true

  count = 1
  # the VPC subnet
  subnet_id = "${aws_subnet.web-b.id}"
  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"
  tags {
    Name = "example1B"
  }

}

resource "aws_instance" "private-b" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  monitoring = true
  count = 2
  subnet_id = "${aws_subnet.private-a.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  key_name = "${aws_key_pair.mykeypair.key_name}"
  tags {
    Name = "Private-1A"
  }
}

resource "aws_instance" "private" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  monitoring = true
  count = 2
  subnet_id = "${aws_subnet.private-b.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  key_name = "${aws_key_pair.mykeypair.key_name}"
  tags {
    Name = "Private-1b"
  }
}

resource "aws_instance" "elasticsearch_Ububtu" {
  ami = "ami-4d202037"
  instance_type = "t2.micro"
  monitoring = true
  count = 1
  subnet_id = "${aws_subnet.data-a.id}"
  key_name = "${aws_key_pair.mykeypair.key_name}"
  private_ip = ""
  vpc_security_group_ids = [
    "${aws_security_group.allow-ssh.id}"]
  tags {
    Name = Ubuntu Instance
    Purp = Elastic Search
  }
}

resource "aws_instance" "Sophos-UTM" {
  ami = "ami-6182bb77"
  instance_type = "m3.large"
  monitoring = true
  count = 1
  subnet_id = "${aws_subnet.public-b.id}"
  private_ip = ""
  vpc_security_group_ids = ["${aws_security_group.SophosUTM-SG.id}"]
 # private_ip = "10.0.3.3"

}
# attach the EIP to the Sophos UTM
resource "aws_eip" "sophosUTM" {
  instance = "${aws_instance.Sophos-UTM.id}"
  vpc = true
}


resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-1a"
  availability_zone = "us-east-1b"
  size = 20
  type = "gp2"
  tags {
    Name = "extra volume data"
  }
}
resource "aws_ebs_volume" "ebs-volume-2" {
  availability_zone = "us-east-1a"
  availability_zone = "us-east-1b"
  size = 20
  type = "gp2"
  tags {
    Name = "extra volume data volume 2"
  }
}
#
#resource "aws_volume_attachment" "ebs-volume-1-attachment" {
 # device_name = "/dev/xvdh"
  #volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
  #instance_id = "${aws_instance.example.id}"

#}

  #instance_id = "${aws_instance.dataserver.id}"
  #instance_id = "${aws_instance.private.id}"

#}

# resource "aws_volume_attachment" "ebs-volume-2-attachment" {
 # device_name = "/dev/xvdh"
  #volume_id = "${aws_ebs_volume.ebs-volume-2.id}"
  #instance_id = "${aws_instance.private.id}"


