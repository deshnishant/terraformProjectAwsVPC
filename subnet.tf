resource "aws_subnet" "my-pub1-subnet" {
    vpc_id = aws_vpc.my-vpc.vpc_id
    cidr_block = "10.0.0.16/28"
    availability_zone= "ap-south-1a"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "my-pub1-subnet"
    }
}

resource "aws_subnet" "my-pub2-subnet" {
    vpc_id = aws_vpc.my-vpc.vpc_id
    cidr_block = "10.0.0.32/28"
    availability_zone= "ap-south-1a"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "my-pub2-subnet"
    }
}

resource "aws_subnet" "my-pri1-subnet" {
    vpc_id = aws_vpc.my-vpc.vpc_id
    cidr_block = "10.0.0.48/28"
    availability_zone= "ap-south-1b"
    map_public_ip_on_launch = "false"

    tags = {
        Name = "my-pri1-subnet"
    }
}

resource "aws_subnet" "my-pri2-subnet" {
    vpc_id = aws_vpc.my-vpc.vpc_id
    cidr_block = "10.0.0.64/28"
    availability_zone= "ap-south-1b"
    map_public_ip_on_launch = "false"

    tags = {
        Name = "my-pri2-subnet"
    }
}

resource "aws_subnet" "my-db1-subnet" {
    vpc_id = aws_vpc.my-vpc.vpc_id
    cidr_block = "10.0.0.80/28"
    availability_zone= "ap-south-1c"
    map_public_ip_on_launch = "false"

    tags = {
        Name = "my-db1-subnet"
    }
}

resource "aws_subnet" "my-db2-subnet" {
    vpc_id = aws_vpc.my-vpc.vpc_id
    cidr_block = "10.0.0.96/28"
    availability_zone= "ap-south-1c"
    map_public_ip_on_launch = "false"

    tags = {
        Name = "my-db2-subnet"
    }
}



