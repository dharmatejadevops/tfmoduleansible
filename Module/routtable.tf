resource "aws_route_table" "myrt" {
  vpc_id = "${aws_vpc.MyVpc.id}"
  tags{
    Name = "myrt"
  }
  
  route{
  cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.myigw.id}"
}
 
}
resource "aws_route_table_association" "myasso" {
   subnet_id = "${aws_subnet.mysubnet.id}"
  route_table_id ="${aws_route_table.myrt.id}"
  
}
