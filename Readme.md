# TIS Automation Challenge

Projeto consiste em subir uma infra na AWS através de uma pipeline .gitlab-ci.yml onde serão provisionados 4 hosts t2.micro, 2 Linux e 2 Windows utlizando Terraform, em seguida será realizado configuração do Apache nos 2 servidores Windows e NGINX no 2 servidores Linux utilizando Ansible.

Obseração: Trata-se da implementação do desafio: [TIS-Automation-Challenge](https://github.com/stone-payments/tis-automation-challenge).

# O que é necessário para executar a Pipeline ?

- **Conta na AWS** - No caso a princípio o projeto só utiliza recursos da Freetier.
- **Identity and Access Management (IAM)** - Necessário criar usuário na AWS para inserir os dados do mesmo nas variáveis e conseguir criar o ambiente.
- **Bucket S3** - Criar um bucket na AWS e Alterar o arquivo `backend.tf` alterando o nome do bucket para o que foi criado.
- **Chave PEM** - Gerar chave PEM com nome `chave_privada_gitlab`, caso crie com outro nome será necessário alterar a variavel e os arquivos do terraform e da pipeline.
- **Gitlab** - Com uma conta free no Gitlab, já é possível executar a pipeline.

## No Gitlab realizar os seguintes passos

Para utlizar o projeto será necessário acessar o mesmo através do link [TIS-Automation-Challenge](https://gitlab.com/robsonngr/tis-automation-challenge) , em seguida realizar um Fork do mesmo clicando em **Fork**.
**Observação:** Necessário estar logado em sua conta do GitLab.

Em seguida será necessário criar as variáveis necessárias para execução da Pipeline, estando na pagina do projeto após o **Fork**, deverá acessar **Settings>CI/CD>Variables>Expand** .

Criar as seguintes variáveis:


KEY | Type | Value 
:--------- | :------: | -------:
AWS_ACCESS_KEY_ID | Variable | ID do usuário criado na AWS em IAM
AWS_SECRET_ACCESS_KEY | Variable | Secret gerada para o usuário criado na AWS em IAM
chave_privada_gitlab | File | Conteudo do arquivo de chave privada PEM gerado
SSH_PRIVATE_KEY | Variable | Conteudo do arquivo de chave privada PEM gerado
TF_VAR_admin_password | Variable | Senha que será configurada para o usuário Administrator do servidores Windows

# Executando a Pipeline

Após realizar as configurações poderá executar a pipeline através do menu **CI/CD>Pipelines** ou executando um commit na **branch Master**, será iniciado a execução da pipeline que contém os seguintes estágios.

- validate - Executado automativamente. Realiza a validação dos arquivos do terraform.
- plan - Executado automaticamente caso validate ocorra com sucesso. Realiza o plan do terraform e informa um plano detalhado do que será executado.
- apply - Optei por deixar para ser executado manualmente, porém ele depende do estágio do plan ter sido executado com sucesso, esse estágio realiza a criação do ambiente conforme descrito nos arquivos do terraform.
- ansible - Realiza o provisionamento configurando os hosts com Ansible, este passo também está como manual.
- destroy - Estagio que realiza o destroy do ambiente removendo todos os recursos criados. Estágio deve ser executado de forma manual quando desejar destruir o ambiente.

# Desafios encontrados

 - Criação da API a qual ainda não foi concluída porém estou desenvolvendo.
 - Configuração do WinRM (Windows Remote Management), porém o obstáculo foi superado utilizando o `user_data` para executar script powershell, disponibilizado na documentação do Ansible, durante a criação dos hosts Windows.
 

# Melhorias que podem ser realizadas

- Podemos realizar melhorias no código do terraform com utilização de modulos o que facilitaria inclusive a reutilização do código em novos projetos.
- Criação de novos recursos que poderiam trazer melhorias e mais robustes para nossa infra como Virtual Private Cloud, Subnet, Internet Gateway, tabela de roteamento, etc...