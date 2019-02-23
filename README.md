# terraform-child-vpc

This terraform module creates child vpc to be attached to a [transit-vpc](https://stash.clearme.com/projects/TER/repos/terraform-transit-vpc/browse)

---

## Introduction

The module provisions the following resources:

- terraform-aws-modules/vpc/aws
- terraform-aws-dynamic-subnets


## Usage


For a complete example, see [examples]

```hcl
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
```

## Inputs

| Name | Description | Type | Required |
|------|-------------|:----:|:-----:|:-----:|
| vpc-name | Name for the VPC | `<string>` | yes |
| vpc-cidr | VPC CIDR (ie. 10.0.0.0/22) | `<string>` | yes |
| availability-zones | Availability Zones to associate with the vpc | `<list>` | yes |
| elb_private_subnet_suffix | Suffix to add to elb private subnet | `<string>` | yes |
| elb_private_subnets | CIDR of the private elb subnet | `<list>` | yes |
| app_private_subnet_suffix | Suffix to add to app private subnet | `<string>` | yes |
| app_private_subnets |  CIDR of the private app subnet | `<list>` | yes |
| db_private_subnet_suffix | Suffix to add to db private subnet | `<string>` | yes |
| db_private_subnets |  CIDR of the private db subnet | `<list>` | yes |
