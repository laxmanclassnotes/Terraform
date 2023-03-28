variable "region" {
  type        = string
  default     = "ap-southeast-1"
  description = "to default region"
}

variable "basic-cidr-range" {
  type        = string
  default     = "192.168.0.0/16"
  description = "to default cidr-block"
}

variable "basic-subnet-azs" {
  type        = list(string)
  default     = ["a", "b", "a", "b", "a", "b"]
  description = "subnet azs"
}
variable "basic-subnet-Names" {
  type    = list(string)
  default = ["app1", "app2", "db1", "db2", "web1", "web2"]
}