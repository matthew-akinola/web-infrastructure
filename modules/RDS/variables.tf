

variable "db_sg" {
  type = list
  description = "The DB security group"
}

variable "database_subnets" {
  type        = list
  description = "database subnets group"
}

variable "db_name" {
  type        = string
  description = "database identifier"
}
