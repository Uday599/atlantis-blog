
############ PROVIDER BLOCK ############
provider "aws" {
  region     = "us-east-1"
  profile    = "default"
}
############ SAVING TF STATE FILE #########
terraform {
  backend "s3" {
    bucket  = "test-atlantis-easydeploy"
    key     = "atlantis/terraform.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
}
################# EC2 INSTANCE CREATION #########
# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   # filter {
#   #   name   = "virtualization-type"
#   #   values = ["hvm"]
#   # }

#   owners = ["099720109477"]
# }

resource "aws_instance" "web" {
  # ami           = data.aws_ami.ubuntu.id
  ami = "ami-0e001c9271cf7f3b9"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-atlantis"
  }
}
