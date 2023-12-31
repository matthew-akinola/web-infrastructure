region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"


preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

environment = "dev"

webserver_ami = "ami-024e6efaf93d85776" #ubuntu ami for webserer

db_name = "webserver-db"

keypair = "devops"
