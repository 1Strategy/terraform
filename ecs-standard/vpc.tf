resource "aws_vpc" "vpc" {
    cidr_block           = "${var.vpc_cidr_block}"
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags {
        Name  = "1S ECS Demo VPC"
    }
}

resource "aws_subnet" "subnets" {
    count                   = 4
    vpc_id                  = "${aws_vpc.vpc.id}"
    cidr_block              = "${element(var.subnet_cidr_blocks, count.index)}"
    availability_zone       = "${element(var.azs, count.index)}"
    map_public_ip_on_launch = "${replace(replace(element(var.subnet_cidr_blocks, count.index), "/10.25.(0|32).0/19/", "1"), "/10.*/", "0")}"

    tags {
        Name  = "1S ECS Demo Subnet"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.vpc.id}"

    tags {
        Name = "1S ECS Demo Gateway"
    }
}

resource "aws_route_table" "routes" {
    depends_on = ["aws_internet_gateway.gw"]

    vpc_id = "${aws_vpc.vpc.id}"

    route {
        cidr_block = "10.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags {
        Name = "1S ECS Demo Route Table"
    }
}