variable "access_key" { default = "INSERT_ACCESS_KEY_HERE" }
variable "secret_key" { default = "INSERT_SECRET_ACCESS_KEY_HERE" }
variable "instance_type" { default = "t1.micro" }
variable "region" { default = "us-east-1" }
variable "ami" { default = "ami-408c7f28" }
variable "security_groups" { default = [] }

output "url" {
	value = "${aws_instance.petclinic.public_dns}:9966/petclinic"
}
