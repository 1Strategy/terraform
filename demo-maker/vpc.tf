resource "aws_vpc" "demo_vpc" {
    cidr_block           = "${var.vpc_cidr_block}"
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags {
        Name  = "1S ECS Demo VPC"
    }
}

resource "aws_subnet" "subnets" {
    count                   = 2
    vpc_id                  = "${aws_vpc.demo_vpc.id}"
    cidr_block              = "${element(var.subnet_cidr_blocks, count.index)}"
    availability_zone       = "${element(var.azs, count.index)}"
    map_public_ip_on_launch = "${replace(replace(element(var.subnet_cidr_blocks, count.index), "/10.25.(0|32).0/19/", "1"), "/10.*/", "0")}"

    tags {
        Name = "1S ECS Demo Subnet"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.demo_vpc.id}"

    tags {
        Name = "1S ECS Demo Gateway"
    }
}

resource "aws_default_route_table" "routes" {
    default_route_table_id = "${aws_vpc.demo_vpc.default_route_table_id}"

    route {
        cidr_block = "10.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags {
        Name = "1S ECS Demo Route Table"
    }
}

resource "aws_route_table_association" "public-a" {
    subnet_id = "${aws_subnet.subnets.0.id}"
    route_table_id = "${aws_default_route_table.routes.id}"
}

resource "aws_route_table_association" "public-b" {
    subnet_id = "${aws_subnet.subnets.1.id}"
    route_table_id = "${aws_default_route_table.routes.id}"
}