variable "vpc-name" {}
variable "vpc-cidr" {}
variable "availability-zones" {
    type = "list"
}
variable "elb_private_subnet_suffix" {}

variable "elb_private_subnets" {
    type = "list"
}
variable "app_private_subnet_suffix" {}

variable "app_private_subnets" {
    type = "list"
}
variable "db_private_subnet_suffix" {}

variable "db_private_subnets" {
    type = "list"
}