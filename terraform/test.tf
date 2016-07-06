provider "aws" {
	region = "ap-southeast-2"
}

resource "aws_security_group" "consul" {
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = [
			"0.0.0.0/0"
		]
	}
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = [
			"0.0.0.0/0"
		]
	}
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = [
			"0.0.0.0/0"
		]
	}
	tags {
		Name = "consul_instance"
	}
}

resource "aws_iam_instance_profile" "consul_profile" {
	name = "consul_profile"
	roles = [
		"${aws_iam_role.consul_role.name}"]
}

resource "aws_iam_role" "consul_role" {
	name = "consul_role"
	path = "/"
	assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [{
		"Action": "sts:AssumeRole",
		"Principal": {
		"Service":
			[
				"ec2.amazonaws.com"
			]
		},
		"Effect": "Allow",
		"Sid": ""
	}]
}
EOF
}

//resource "aws_instance" "consul" {
//	ami = "ami-09daf96a"
//	instance_type = "t2.micro"
//	key_name = "stig"
//	associate_public_ip_address = true
//	monitoring = true
//	security_groups = [
//		"${aws_security_group.consul.name}",
//	]
//	iam_instance_profile = "${aws_iam_instance_profile.consul_profile.name}"
//	tags {
//		Name = "consul"
//	}
//}

resource "aws_spot_instance_request" "consul" {
	spot_price = "0.015"
	wait_for_fulfillment = true

	ami = "ami-09daf96a"
	instance_type = "m3.medium"
	key_name = "stig"
	associate_public_ip_address = true
	monitoring = true
	security_groups = [
		"${aws_security_group.consul.name}",
	]
	iam_instance_profile = "${aws_iam_instance_profile.consul_profile.name}"
	tags {
		Name = "CheapWorker"
	}
}
