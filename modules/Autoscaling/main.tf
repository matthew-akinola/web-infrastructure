
# ------ Autoscaling group for webserver ---------

resource "aws_autoscaling_group" "webserver_asg" {
  name                      = "webserver-asg"
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = var.desired_capacity
  
  vpc_zone_identifier = var.private_subnets


  launch_template {
    id      = aws_launch_template.webserver_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "webserver-autoscaling-group"
    propagate_at_launch = true
  }
}
