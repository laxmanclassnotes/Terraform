output "apache_url" {
  value = "http://${aws_instance.myec2.public_ip}"
}