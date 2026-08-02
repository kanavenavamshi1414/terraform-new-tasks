resource "aws_lb" "this" {

  name = var.alb_name

  internal = var.internal

  load_balancer_type = "application"

  security_groups = var.security_groups

  subnets = var.subnet_ids


  enable_deletion_protection = false


  tags = {
    Name = var.alb_name
  }
}



resource "aws_lb_target_group" "this" {

  name = "${var.alb_name}-tg"

  port = var.target_port

  protocol = "HTTP"

  vpc_id = var.vpc_id


  health_check {

    enabled = true

    path = var.health_check_path

    port = var.target_port

    protocol = "HTTP"

    healthy_threshold = 3

    unhealthy_threshold = 3

    interval = 30

    timeout = 5
  }


  tags = {

    Name = "${var.alb_name}-tg"

  }
}



resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.this.arn

  port = 80

  protocol = "HTTP"


  default_action {

    type = "forward"


    target_group_arn = aws_lb_target_group.this.arn

  }
}



resource "aws_lb_target_group_attachment" "this" {

  count = length(var.instance_ids)


  target_group_arn = aws_lb_target_group.this.arn


  target_id = var.instance_ids[count.index]


  port = var.target_port
}