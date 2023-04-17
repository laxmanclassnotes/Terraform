output "ansible_version" {
  value = jsondecode(null_resource.ansible_install.*.stdout[0]).ansible_version
}