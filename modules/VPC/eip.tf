resource "aws_eip" "webserver_alb_eip" {
  vpc   = true
}

resource "aws_eip_association" "webserver_alb_eip_association" {
  allocation_id = aws_eip.webserver_alb_eip.id
  instance_id = var.webserver_lb_id
}
