#terraform {
#  backend "local" {
#      path = "terraform.tfstate"
#  }
#}

terraform {
  backend "s3" {
    region = "us-east-1" # Substitua o valor pela região onde criou o bucket
    bucket = "NOME_DO_BUCKET" # Substitua pelo nome do bucket criado
    key    = "tfstate"
  }
}