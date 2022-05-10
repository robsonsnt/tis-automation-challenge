resource "aws_instance" "linux" {
  count         = 2
  ami           = var.amis["us-east-1"]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    "Name" = "linux-server${count.index}"
    "Group" = "Linux"
  }
  vpc_security_group_ids = ["${aws_security_group.sg_servidoresweb.id}"]

  #provisioner "local-exec" {
  #  command = "sleep 60 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook_linux_servers.yml -i inventory.aws_ec2.yml"
  #}
}
