resource "aws_security_group" "mysg" {
  name ="musg"
  tags{
    Name = "mysg"
  }
  vpc_id  = "${aws_vpc.MyVpc.id}"
  ingress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }
  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }
}
