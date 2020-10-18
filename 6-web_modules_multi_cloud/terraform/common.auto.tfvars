name = "peakit"

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

sg_whitelist_ssh = [
  "0.0.0.0/0"
]