provider "aws" {
    region = "us-west-2"
}

module "efs_module" {
  source = "../modules/efs"
  vpc_id = "vpc-0ed285ea963494f08"
  subnet_ids = ["subnet-08dd96fa40567eaa0", "subnet-08f83690aa38fd8b0", "subnet-094eaea8c6ca55140"]
}