vpc-name                    =   "example-vpc"
vpc-cidr                    =   "10.6.32.0/20"
availability-zones      =   ["us-east-1a", "us-east-1b", "us-east-1c"]

elb_private_subnet_suffix   =   "elb-private"
elb_private_subnets         =   ["10.6.32.0/24", "10.6.33.0/24", "10.6.34.0/24"]

app_private_subnet_suffix   =   "app-private"
app_private_subnets         =   ["10.6.35.0/24", "10.6.36.0/24", "10.6.37.0/24"]

db_private_subnet_suffix   =   "db-private"
db_private_subnets         =   ["10.6.38.0/24", "10.6.39.0/24", "10.6.40.0/24"]
