variable "region" {
  type    = string
  default = "us-west-2"

}
variable "myvpc_info" {
  type = object({
    vpc_cidr        = string,
    subnet_azs      = list(string),
    subnet_names    = list(string),
    private_subnets = list(string),
    public_subnets  = list(string)
    db_subnets      = list(string)
  })
  default = {
    vpc_cidr        = "192.168.0.0/16"
    subnet_azs      = ["a", "b", "a", "b", "a", "b"]
    subnet_names    = ["app1", "app2", "db1", "db2", "web1", "web2"]
    public_subnets  = ["web1", "web2"]
    private_subnets = ["app1", "app2", "db1", "db2"]
    db_subnets      = ["db1", "db2"]

  }
}