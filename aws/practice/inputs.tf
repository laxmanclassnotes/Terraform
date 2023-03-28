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
variable "app1-cidr" {
  type        = string
  default     = "192.168.0.0/24"
  description = "for app1 subnet"
}
variable "app2-cidr" {
  type        = string
  default     = "192.168.2.0/24"
  description = "for app2 subnet"
}
variable "web1-cidr" {
  type        = string
  default     = "192.168.3.0/24"
  description = "for web1 subnet"
}
variable "web2-cidr" {
  type        = string
  default     = "192.168.4.0/24"
  description = "for web2 subnet"
}