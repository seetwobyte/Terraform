

output "instance" {
  value = "${aws_instance.Nginx-1.public_dns}"
}

output "instance-2" {
  value = "${aws_instance.Nginx-2.public_dns}"
}

output "instance-3" {
  value = "${aws_instance.Bastion_Host.public_dns}"
}

output "web-elb" {
  value = "${aws_elb.Web-elb.dns_name}"

}

