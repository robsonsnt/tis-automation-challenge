resource "aws_security_group" "sg_servidoresweb" {
  name        = "sg_servidoresweb"
  description = "Allow necessary access for traffic inbound and outbound"

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 3389
    to_port          = 3389
    protocol         = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 5985
    to_port          = 5986
    protocol         = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
  }

 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_servidoresweb"
  }
}