resource "aws_vpc" "MyVpc" {
  cidr_block = "10.15.0.0/16",
  tags{
    Name = "MyVpc",
  }
}
resource "aws_subnet" "mysubnet" {
   vpc_id     = "${aws_vpc.MyVpc.id}"
   cidr_block = "10.15.0.0/24"
  tags{
    Name = "mysubnet"
 }
}
resource "aws_internet_gateway" "myigw" {
  vpc_id = "${aws_vpc.MyVpc.id}"
   tags{
    Name = "myigw"
 }
}
