output "alb_dns_name" {
  value       = aws_lb.webserver_alb.dns_name
  description = "load balancer DNS name"
}

output "webserver_alb_tgt" {
  description = "webserver Load balancaer target group"
  value       = aws_lb_target_group.webserver_alb_tgt_grp.arn
}


output "webserver_lb_id" {
  description =   "webserverernal loadbalncer instance ID"
  value       =   aws_lb.webserver_alb.id

}