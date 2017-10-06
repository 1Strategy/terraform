resource "aws_vpc" "1s_test_vpc" {
    cidr_block           = "${var.vpc_cidr_block}"
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags {
        Name  = "1S Test VPC"
    }
}

resource "aws_subnet" "1s_test_subnets" {
    count                   = 4
    vpc_id                  = "${aws_vpc.big_data_vpc.id}"
    cidr_block              = "${element(var.subnet_cidr_blocks, count.index)}"
    availability_zone       = "${element(var.azs, count.index)}"
    map_public_ip_on_launch = "${replace(replace(element(var.subnet_cidr_blocks, count.index), "/10.25.(0|32).0/19/", "1"), "/10.*/", "0")}"

    tags {
        Name  = "${var.class} ${replace(replace(element(var.subnet_cidr_blocks, count.index), "/10.25.(0|32).0/19/", "Public"), "/10.*/", "Private")}"
        Class = "${var.class}"
    }
}

// resource "aws_vpc_endpoint" "s3" {
//     vpc_id       = "${aws_vpc.big_data_vpc.id}"
//     service_name = "com.amazonaws.us-west-2.s3"
// }

// resource "aws_vpc_endpoint_route_table_association" "s3_association" {
//     depends_on = ["aws_route_table.routes"]

//     vpc_endpoint_id = "${aws_vpc_endpoint.s3.id}"
//     route_table_id  = "${aws_route_table.private.id}"
// }

// resource "aws_internet_gateway" "gw" {
//     vpc_id = "${aws_vpc.big_data_vpc.id}"

//     tags {
//         Name = "main"
//     }
// }

// resource "aws_route_table" "routes" {
//     depends_on = ["aws_internet_gateway.gw"]

//     vpc_id = "${aws_vpc.big_data_vpc.id}"

//     route {
//         cidr_block = "10.0.0.0/0"
//         gateway_id = "${aws_internet_gateway.gw.id}"
//     }

//     tags {
//         Name = "main"
//     }
// }