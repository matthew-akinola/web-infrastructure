
output "webserver_alb_sg" {
  value = aws_security_group.webserver_alb_sg.id
}

output "rds_sg" {
  value = aws_security_group.rds_sg.id
}
