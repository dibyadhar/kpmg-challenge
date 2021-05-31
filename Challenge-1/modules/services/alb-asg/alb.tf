resource "aws_lb" "this_lb" {
  name = var.lb_name
  internal = false
  load_balancer_type = var.lb_type
  security_groups = [var.lb_sg]
  //if required basically for higher environment
  enable_deletion_protection = false
  subnets            = var.lb_subnet

  tags = {
    Costcenter = var.tag_costcenter
    Owner      = var.tag_owner
  }
}

resource "aws_lb_target_group" "this_tg" {
  name = "${var.lb_name}-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.this_lb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.this_tg.arn
  }
}



