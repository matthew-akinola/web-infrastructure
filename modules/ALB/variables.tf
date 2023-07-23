
variable "webserver_alb_sg" {
  description = "Security group for external load balancer"
}


# The public subnet froup for external loadbalancer
variable "public_subnets" {
  type = list
  description = "Public subnets to deploy external ALB"
}

variable "vpc_id" {
  type        = string
  description = "The vpc ID"
}



variable "ip_address_type" {
  type        = string
  description = "IP address for the ALB"

}

variable "load_balancer_type" {
  type        = string
}

variable "name" {
    type = string
    description = "name of the loadbalancer"
  
}