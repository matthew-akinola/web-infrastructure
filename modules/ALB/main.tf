
#---------------------------------

resource "aws_lb" "webserver_alb" {
  name            = var.name
  internal        = false
  security_groups = [var.webserver_alb_sg]

  subnets = var.public_subnets

  tags = {
      Name = "${var.name}-webserver-alb"
    }
  
  ip_address_type    = var.ip_address_type
  load_balancer_type = var.load_balancer_type
}

#--- create a target group for the webserverer load balancer
resource "aws_lb_target_group" "webserver_alb_tgt_grp" {
  health_check {
    interval            = 10
    path                = "/healthstatus"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
  name        = "alb-tgt-grp"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
}

#--- create a listener for the load balancer
resource "aws_lb_listener" "webserver_alb_listener" {
  load_balancer_arn = aws_lb.webserver_alb.arn
  port              = 80
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webserver_alb_tgt_grp.arn
  }
}