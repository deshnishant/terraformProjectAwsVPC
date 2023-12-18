# Create Load balancer - web tier
resource "aws_lb" "my-web-lb" {
  name               = "my-web-lb"
  internal           = true
  load_balancer_type = "application"
  
  security_groups    = [aws_security_group.my-alb-sg-1.id]
  subnets            = [aws_subnet.my-pub1-subnet.id, aws_subnet.my-pub2-subnet.id]

  tags = {
    Environment = "three-tier-web-lb"
  }
}

# create load balancer larget group - web tier

resource "aws_lb_target_group" "my-web-lb-tg" {
  name     = "my-web-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id

  health_check {
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

# Create Load Balancer listener - web tier
resource "aws_lb_listener" "my-web-lb-listner" {
  load_balancer_arn = aws_lb.three-tier-web-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-web-lb-tg.arn
  }
}

# Register the instances with the target group - web tier
resource "aws_autoscaling_attachment" "my-web-asattach" {
  autoscaling_group_name = aws_autoscaling_group.my-web-asg.name
  alb_target_group_arn   = aws_lb_target_group.my-web-lb-tg.arn
  
}