aws_region = "eu-west-1"

vpc_cidr = "10.0.0.0/16"

subnet_pub = [
  {
    cidr = "10.0.10.0/24"
    az   = "eu-west-1a"
  },
  {
    cidr = "10.0.20.0/24"
    az   = "eu-west-1b"
  }
]

subnet_priv = [
  {
    cidr = "10.0.50.0/24"
    az   = "eu-west-1a"
  }
]

instance_type = "t2.micro"
instance_ami  = "ami-0ce49ca477b768354"
sg_whitelist_ssh = [
  "188.27.40.216/32",
  "0.0.0.0/0"
]
sg_whitelist = "0.0.0.0/0"

alb_config = {
  alb_port     = 80
  alb_protocol = "HTTP"
  be_port      = 80
  be_protocol  = "HTTP"
  idle_timeout = 600
}

nat_instance_ami = "ami-024107e3e3217a248"