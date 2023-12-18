resource "aws_nat_gateway" "my-ngw" {
     allocation_id = aws_eip.my-nat-eip.id
  subnet_id     = aws_subnet.my-pub1-subnet.id

  tags = {
    Name = "my-ngw"
  }
  depends_on = [aws_internet_gateway.my-igw]

}