resource "aws_autoscaling_group" "this_asg" {
  launch_template {
    id = aws_launch_template.this_template.id
    version = "$Latest"
  }
  //   availability_zones = ["${aws_subnet.public-subnet-1a.availability_zone}"]
  vpc_zone_identifier = var.asg_subnet
  health_check_grace_period = 300
  health_check_type = "ELB"
  default_cooldown = 0

  max_size = var.max_size
  min_size = var.min_size
  desired_capacity = var.desired_capacity

}

# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.this_asg.id
  alb_target_group_arn = aws_lb_target_group.this_tg.arn
}
