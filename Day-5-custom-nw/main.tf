# create VPC
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "terra_vpc"
  }
}

# Create subnets
resource "aws_subnet" "name_pub" {
    vpc_id = aws_vpc.name.id
    availability_zone = "ap-south-1a"
    cidr_block = "10.0.0.0/24"
    tags = {
      "Name" = "pub_sub_01" 
    }
  
}

resource "aws_subnet" "name_pvt" {
    vpc_id = aws_vpc.name.id
    availability_zone = "ap-south-1a"
    cidr_block = "10.0.1.0/24"
    tags = {
      "Name" = "pvt_sub_01" 
    }
  
}

# create IG attach to VPC
resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
  tags = {
    "Name" = "terra_IG"
  }
}

# create route attach to routes
resource "aws_route_table" "name01" {
  vpc_id = aws_vpc.name.id
  
  route {
    cidr_block= "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
  tags = {
    "Name" = "terra_RT_01" 
  }
}
      # Associate the Subnet to the Route Table

resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.name_pub.id
  route_table_id = aws_route_table.name01.id
}

# Create SG
resource "aws_security_group" "name" {
  name = "SG01"  
  description = "allow"
  vpc_id = aws_vpc.name.id
  tags = {
    "Name" = "Dev_SG" 
  }
  
  ingress{
    description= "HTTP"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description= "SSH"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    description= "HTTPs"
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = [ "0.0.0.0/0" ]
  }
}

# create servers

resource "aws_instance" "name" {
  ami = "ami-0bc7aabcf58d1e02a"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.name_pub.id
  vpc_security_group_ids = [ aws_security_group.name.id ]
  associate_public_ip_address = true
  tags = {
    "Name" = "public_server_01"
  }
}

resource "aws_instance" "name01" {
  ami = "ami-0bc7aabcf58d1e02a"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.name_pvt.id
  vpc_security_group_ids = [ aws_security_group.name.id ]
  associate_public_ip_address = false
  tags = {
    "Name" = "private_server_01"
  }
}

