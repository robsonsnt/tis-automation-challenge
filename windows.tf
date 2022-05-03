resource "aws_instance" "windows" {
  ami = "ami-08ed5c5dd62794ec0"
  count         = 1
  instance_type = var.instance_type
  key_name      = var.key_name
  #vpc_security_group_ids =["sg-fdb42694"]
  get_password_data = "true"
  user_data     = <<EOF
<powershell>
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)

powershell.exe -ExecutionPolicy ByPass -File $file

Set-Item -Path WSMan:\localhost\Service\Auth\Certificate -Value $true
# Set Administrator password
$admin = [adsi]("WinNT://./administrator, user")
$admin.psbase.invoke("SetPassword", "${var.admin_password}")
</powershell>
EOF
  tags = {
    "Name" = "windows-server${count.index}"
    "Group" = "Windows"
  }
  vpc_security_group_ids = ["${aws_security_group.sg_servidoresweb.id}"]
}