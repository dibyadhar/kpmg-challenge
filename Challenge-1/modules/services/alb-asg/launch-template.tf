//Create launch template

data "template_file" "userdata" {
  template = file("${path.module}/user-data.sh")
 
}



//Create launch template to use while launching instances from ASG
resource "aws_launch_template" "this_template" {
  name                   = "launch-temp"
  image_id               = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.asg_sg]
  key_name               = var.key_name
  user_data              = base64encode(data.template_file.userdata.rendered)

  lifecycle {
    create_before_destroy = true
  }
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = var.app_name
      Costcenter  = var.tag_costcenter
      Owner       = var.tag_owner
    }
  }
}
