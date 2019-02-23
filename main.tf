module "child-vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = "${var.vpc-name}"
    cidr = "${var.vpc-cidr}"

    azs = "${var.availability-zones}"
    propagate_private_route_tables_vgw = false

    enable_nat_gateway = false
    enable_vpn_gateway = true
    enable_dns_hostnames = true

    tags = {
        Terraform = "true"
        Environment = "${var.vpc-name}"
    }
}
module "elb-subnets" {
    source = "git::https://github.com/victorcuascut/terraform-aws-dynamic-subnets.git?ref=master"
    name = "${var.vpc-name}"
    vpc_id = "${module.child-vpc.vpc_id}"

    aws_nat_gateway = "${module.child-vpc.natgw_ids}"
    aws_internet_gateway = "${module.child-vpc.igw_id}"
    aws_vpn_gateway = "${module.child-vpc.vgw_id}"
    propagate_private_route_tables_vgw = true
    propagate_public_route_tables_vgw = false

    azs             = "${var.availability-zones}"
    private_subnets = "${var.elb_private_subnets}"
    private_subnet_suffix="${var.elb_private_subnet_suffix}"
    enable_nat_gateway = false

    tags = {
        Terraform = "true"
        Environment = "${var.vpc-name}"
    }
}
module "app-subnets" {
    source = "git::https://github.com/victorcuascut/terraform-aws-dynamic-subnets.git?ref=master"
    name = "${var.vpc-name}"
    vpc_id = "${module.child-vpc.vpc_id}"

    aws_nat_gateway = "${module.child-vpc.natgw_ids}"
    aws_internet_gateway = "${module.child-vpc.igw_id}"
    aws_vpn_gateway = "${module.child-vpc.vgw_id}"
    propagate_private_route_tables_vgw = true
    propagate_public_route_tables_vgw = false

    azs             = "${var.availability-zones}"
    private_subnets = "${var.app_private_subnets}"
    private_subnet_suffix="${var.app_private_subnet_suffix}"
    enable_nat_gateway = false

    tags = {
        Terraform = "true"
        Environment = "${var.vpc-name}"
    }
}
module "db-subnets" {
    source = "git::https://github.com/victorcuascut/terraform-aws-dynamic-subnets.git?ref=master"
    name = "${var.vpc-name}"
    vpc_id = "${module.child-vpc.vpc_id}"

    aws_nat_gateway = "${module.child-vpc.natgw_ids}"
    aws_internet_gateway = "${module.child-vpc.igw_id}"
    aws_vpn_gateway = "${module.child-vpc.vgw_id}"
    propagate_private_route_tables_vgw = true
    propagate_public_route_tables_vgw = false

    azs             = "${var.availability-zones}"
    private_subnets = "${var.db_private_subnets}"
    private_subnet_suffix="${var.db_private_subnet_suffix}"
    enable_nat_gateway = false

    tags = {
        Terraform = "true"
        Environment = "${var.vpc-name}"
    }
}