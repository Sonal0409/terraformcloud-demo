provider "aws" {
  region = "us-east-1"

}

provider "aws" {
  alias = "region1"
  region = "us-east-1"

}

provider "aws" {
  alias = "region2"
  region = "us-east-2"

}

# terraform to go to AWS and fetch the data

data "aws_ami" "myami"{

most_recent = true

owners = ["amazon"]

filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

}

resource "aws_instance" "myec2" {

 provider = aws.region1
  
  ami           = data.aws_ami.myami.id
  instance_type = "t2.micro"
 tags = {
    Name = "terraform-instance"
  }


}

resource "aws_instance" "myec2-new" {
  provider = aws.region2
  ami           = data.aws_ami.myami.id
  instance_type = "t2.micro"
 tags = {
    Name = "terraform-instance"
  }


}

resource "aws_vpc" "sl-vpc" {
  cidr_block       = "10.0.0.0/16"
   tags = {
    Name = "sl-vpc"
  }
}

