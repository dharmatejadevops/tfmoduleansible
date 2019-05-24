resource "aws_instance" "GameofLife" {
  tags {
    Name = "GameofLife"
  }

  subnet_id                   = "${aws_subnet.mysubnet.id}"
  ami                         = "ami-0a313d6098716f372"
  instance_type               = "t2.micro"
  key_name                    = "AnsibleCM"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.mysg.id}"]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("./Module/AnsibleCM.pem")}"
  }
provisioner "file" {
    source      = "/home/jenkins/workspace/tfansible/gameoflife-web/target/gameoflife.war"
    destination = "/tmp/gameoflife.war"
  }
  provisioner "remote-exec" {
    inline = [
      "git clone https://github.com/dharmatejadevops/ansible-deploy.git",
      "sudo apt-get update",
      "sudo apt-get install software-properties-common -y",
      "sudo apt-add-repository --yes --update ppa:ansible/ansible",
      "sudo apt-get install ansible -y",
      "ansible-playbook /home/ubuntu/ansible-deploy/moduletomcat8.yml",
    ]
  }
}
output "GameoflifeIP" {
  value = "${aws_instance.GameofLife.public_ip}"
}
