variable "regiao" {
  default = "us-east-1"
}

variable "amis" {
  type = map(any)

  default = {
    "us-east-1" = "ami-0c4f7023847b90238"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "chave_privada_pem"
}