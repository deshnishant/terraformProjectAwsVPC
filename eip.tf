#Create an Elastic IP address for the NAT Gateway

resource "aws_eip" "my-nat-eip" {
  vpc = true
}