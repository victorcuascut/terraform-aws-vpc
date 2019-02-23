terraform {
  required_version = ">= 0.9.3"
  backend          "s3"             {}
}

module "child-vpc" {
    source = "../."
    vpc-name = "${var.vpc-name}"
    vpc-cidr = "${var.vpc-cidr}"
    availability-zones = "${var.availability-zones}"

    elb_private_subnet_suffix = "${var.elb_private_subnet_suffix}"
    elb_private_subnets = "${var.elb_private_subnets}"
    
    app_private_subnet_suffix = "${var.app_private_subnet_suffix}"
    app_private_subnets = "${var.app_private_subnets}"

    db_private_subnet_suffix = "${var.db_private_subnet_suffix}"
    db_private_subnets = "${var.db_private_subnets}"
}
