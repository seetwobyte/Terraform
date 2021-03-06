#Create Classic Load Balancers

# Web-ELB

resource "aws_elb" "web-elb" {
  name = "web-elb"
  subnets = ["${aws_subnet.web-a.id}", "${aws_subnet.web-b.id}"]
  security_groups = ["${aws_security_group.allow-ssh.id}"]
  internal = true

 listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  tags {
    Name = "web-elb"
  }
}


# Private-ELB
resource "aws_elb" "private-elb" {
  name = "public-elb"
  security_groups = ["${aws_security_group.allow-ssh.id}"]
  subnets = ["${aws_subnet.private-a.id}","${aws_subnet.private-a.id}"]
  internal = true


listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }
  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  tags {
    Name = "public-elb"

  }
}

# Data-ELB

resource "aws_elb" "data-elb" {
  name = "data-elb"
  security_groups = ["${aws_security_group.allow-ssh.id}"]
  subnets = ["${aws_subnet.data-a.id}", "${aws_subnet.data-b.id}"]
  internal = true

listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }
  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  tags {
    Name = "data-elb"
  }
}


