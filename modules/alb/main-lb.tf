locals {
  allserver = [var.server1, var.server2]
}
resource "aws_lb_target_group_attachment" "test" {
  count = length(local.allserver)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = local.allserver[count.index]
  port             = var.port
}





resource "aws_lb" "my_alb" {
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [var.security_group]
  subnets            = var.subnet_id[*]

  access_logs {
    bucket  = var.log_bucket_name
    prefix  = "alb-logs"
    enabled = true
  }
  tags = {
    Name = var.alb_name
  }
}

resource "aws_lb_target_group" "tg" {
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}



resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

