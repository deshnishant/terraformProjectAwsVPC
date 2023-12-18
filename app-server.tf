# Create an EC2 Auto Scaling Group - app
resource "aws_autoscaling_group" "my-app-asg" {
  name                 = "my-app-asg"
  launch_configuration = aws_launch_configuration.my-app-lconfig.id
  vpc_zone_identifier  = [aws_subnet.my-pri1-subnet.id, aws_subnet.my-pri2-subnet.id]
  min_size             = 2
  max_size             = 3
  desired_capacity     = 2
}

# Create a launch configuration for the EC2 instances
resource "aws_launch_configuration" "my-app-lconfig" {
  name_prefix                 = "my-app-lconfig"
  image_id                    = "ami-0b3a4110c36b9a5f0"
  instance_type               = "t2.micro"
  key_name                    = "my-app-asg-kp"
  security_groups             = [aws_security_group.my-asg-sg-app.id]
  user_data                   = <<-EOF
                                #!/bin/bash

                                sudo yum install mysql -y

                                EOF
                                
  associate_public_ip_address = false
  lifecycle {
    prevent_destroy = false
    ignore_changes  = all
  }
}