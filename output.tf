output "public_ip" {
    value = "${aws_instance.linux.*.public_ip}"
}

output "public_dns" {
    value = "${aws_instance.linux.*.public_dns}"
}