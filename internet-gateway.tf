#Creating Internet Gateway for the VPC to connect Internet

resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my-vpc.id

    tags = {
        Name = "my-igw"
    }
}