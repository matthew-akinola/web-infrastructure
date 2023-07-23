variable "ami_webserver" {
  type        = string
  description = "ami for webservers"
}

variable "instance_profile" {
  type        = string
  description = "Instance profile for launch template"
}


variable "keypair" {
  type        = string
  description = "Keypair for instances"
}

variable "web_sg" {
  type = list
  description = "security group for webservers"
}


variable "private_subnets" {
  type = list
  description = "private subnets for internal ALB"
}

variable "webserver_alb_tgt" {
  type        = string
  description = "loadbalancer target group"
}


variable "max_size" {
  type        = number
  description = "maximum number for autoscaling"
}

variable "min_size" {
  type        = number
  description = "minimum number for autoscaling"
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of instance in autoscaling group"

}