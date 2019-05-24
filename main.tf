module "TF_ANSIBLE" {
  source = "./module"
  accesskey = "${var.accesskey}"
  secretekey = "${var.secretekey}"
}
output "Gameoflifeip" {
  value = "${module.TF_ANSIBLE.GameoflifeIP}"
}
