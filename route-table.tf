resource "aws_route_table" "my-pub-rt"{
    vpc_id = aws_vpc.my-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw.id
    }
}

resource "aws_route_table" "my-pri-rt"{
    vpc_id = aws_vpc.my-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.my-ngw.id
    }
}

# Route Table Association
resource "aws_route_table_association" "my-pub1-rt-as-1" {
  subnet_id      = aws_subnet.my-pub1-subnet.id
  route_table_id = aws_route_table.my-pub-rt.id
}

resource "aws_route_table_association" "my-pub2-rt-as-2" {
  subnet_id      = aws_subnet.my-pub2-subnet.id
  route_table_id = aws_route_table.my-pub-rt.id
}

resource "aws_route_table_association" "my-pri1-rt-as-3" {
  subnet_id      = aws_subnet.my-pri1-subnet.id
  route_table_id = aws_route_table.my-pri-rt.id
}

resource "aws_route_table_association" "my-pri2-rt-as-4" {
  subnet_id      = aws_subnet.my-pri2-subnet.id
  route_table_id = aws_route_table.my-pri-rt.id
}

resource "aws_route_table_association" "my-db1-rt-as-5" {
  subnet_id      = aws_subnet.my-db1-subnet.id
  route_table_id = aws_route_table.my-pri-rt.id
}
resource "aws_route_table_association" "my-db2-rt-as-6" {
  subnet_id      = aws_subnet.my-db2-subnet.id
  route_table_id = aws_route_table.my-pri-rt.id
}