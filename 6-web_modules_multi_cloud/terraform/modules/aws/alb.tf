resource "aws_alb" "alb" {
  count = var.enabled ? 1 : 0
  name  = "${var.name}-alb"
  subnets = [
    aws_subnet.subnet_pub.0.id,
    aws_subnet.subnet_pub_alb_req.0.id
  ]
  security_groups = [aws_security_group.sg_instance.0.id]
  internal        = false
  idle_timeout    = var.alb_config["idle_timeout"]
}

resource "aws_alb_listener" "alb_listener_http" {
  count             = var.enabled ? 1 : 0
  load_balancer_arn = aws_alb.alb.0.arn
  port              = var.alb_config["alb_port"]
  protocol          = var.alb_config["alb_protocol"]

  default_action {
    target_group_arn = aws_alb_target_group.alb_target_group.0.arn
    type             = "forward"
  }
}

resource "aws_alb_target_group" "alb_target_group" {
  count    = var.enabled ? 1 : 0
  name     = "${var.name}-alb-target-group"
  port     = var.alb_config["be_port"]
  protocol = var.alb_config["be_protocol"]
  vpc_id   = aws_vpc.vpc.0.id


  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = var.alb_config["be_port"]
    matcher             = "200,302"
  }
}

resource "aws_alb_target_group_attachment" "alb_target_group_att" {
  count            = var.enabled ? 1 : 0
  target_group_arn = aws_alb_target_group.alb_target_group.0.arn
  target_id        = aws_instance.example.0.id
}
