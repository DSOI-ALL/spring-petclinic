provider "aws" {
	access_key = "${var.access_key}"
	secret_key = "${var.secret_key}"
	region = "${var.region}"
}

resource "aws_instance" "petclinic" {
	ami = "${var.ami}"
	instance_type = "${var.instance_type}"
	key_name = "spring-petclinic"
	security_groups = "${var.security_groups}"

	provisioner "remote-exec" {
		inline = [
			"mkdir petclinic"
		]

		connection {
			type = "ssh"
			user = "ubuntu"
			private_key = "${file("spring-petclinic.pem")}"
		}
	}

	provisioner "file" {
		source = "./"
		destination = "~/petclinic/"

		connection {
			type = "ssh"
			user = "ubuntu"
			private_key = "${file("spring-petclinic.pem")}"
		}
	}

	provisioner "remote-exec" {
		inline = [
			"sudo bash ./petclinic/provision.sh"
		]

		connection {
			type = "ssh"
			user = "ubuntu"
			private_key = "${file("spring-petclinic.pem")}"
		}
	}
}
