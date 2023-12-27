provider "aws" {
  region = "us-west-2"
}

module "ec2_instance" {
  source = "../modules/ec2"

  instance_name      = "jenkins-agent"
  ami_id             = "ami-0b10ff9ed99667367"
  instance_type      = "t2.small"
  key_name           = "SSH"
  subnet_ids         = ["subnet-08dd96fa40567eaa0", "subnet-08f83690aa38fd8b0", "subnet-094eaea8c6ca55140"]
  instance_count     = 1
}