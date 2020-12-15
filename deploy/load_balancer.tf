resource "aws_lb" "resume" {
  name               = "${local.prefix}-main"
  load_balancer_type = "application"
  subnets = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
  ]

  security_groups = [aws_security_group.lb.id]

  tags = local.common_tags
}

resource "aws_lb_target_group" "resume" {
  name        = "${local.prefix}-resume"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"
  port        = 80

  health_check {
    path = "/"
  }
}

resource "aws_lb_listener" "resume" {
  load_balancer_arn = aws_lb.resume.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.resume.arn
  }
}

resource "aws_security_group" "lb" {
  description = "Allow access to Application Load Balancer"
  name        = "${local.prefix}-lb"
  vpc_id      = aws_vpc.main.id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}
