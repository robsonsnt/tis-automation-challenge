output "public_ip_linux" {
    value = "${aws_instance.linux.*.public_ip}"
}

output "public_dns_linux" {
    value = "${aws_instance.linux.*.public_dns}"
}

output "public_ip_windows" {
    value = "${aws_instance.windows.*.public_ip}"
}

output "public_dns_windows" {
    value = "${aws_instance.windows.*.public_dns}"
}