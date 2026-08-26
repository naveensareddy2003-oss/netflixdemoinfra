provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-01a00762f46d584a1"
  instance_type          = "m7i-flex.12xlarge"
  key_name               = "server"
  vpc_security_group_ids = ["sg-0b7bcdd2627b4101c"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "Monitoring server"]
}

resource "aws_s3_bucket" "one" {
  bucket = "picece-bucket-3445"
  versioning {
    enabled = true
  }
}
