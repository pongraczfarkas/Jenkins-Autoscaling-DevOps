provider "aws" {
    region = "us-west-2"
}

module "lb-asg" {
  source = "../modules/lb-asg"
  subnets = ["subnet-08dd96fa40567eaa0", "subnet-08f83690aa38fd8b0", "subnet-094eaea8c6ca55140"]
  ami_id = "ami-0283fa287ab7fa91a"
  instance_type = "t2.small"
  key_name = "SSH"
  environment = "dev"
  vpc_id = "vpc-0ed285ea963494f08"
}