aws_region = "eu-west-1"

vpc_cidr = "10.0.0.0/16"

instance_type = "t2.micro"
instance_ami  = "ami-0ce49ca477b768354"

sg_whitelist = "0.0.0.0/0"

alb_config = {
  alb_port     = 80
  alb_protocol = "HTTP"
  be_port      = 80
  be_protocol  = "HTTP"
  idle_timeout = 600
}

nat_instance_ami = "ami-024107e3e3217a248"