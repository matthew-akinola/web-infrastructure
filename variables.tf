variable "region" {
  default = "eu-west-1"
}

variable "vpc_cidr" {
  type  = string
}

variable "enable_dns_support" {
  type  = bool
}

variable "db_name" {
  type        = string
  description = "database identifier"
}

variable "enable_dns_hostnames" {
  type  = bool
}

variable "preferred_number_of_public_subnets" {
  type        = number
  description = "Number of public subnets"
}

variable "preferred_number_of_private_subnets" {
  type        = number
  description = "Number of private subnets"
}


variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "environment" {
  type        = string
  description = "Enviroment"
}


variable "webserver_ami" {
  type        = string
  description = "AMI ID for the webserver launch template"
}

variable "keypair" {
  type        = string
  description = "key pair for the instances"
}

