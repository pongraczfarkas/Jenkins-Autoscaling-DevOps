# Jenkins Autoscaling DevOps Project 
  
This project demonstrates how to set up Jenkins on AWS using Terraform and Ansible. It also shows how to configure Jenkins to autoscale its agents based on the workload.  
## Prerequisites  
  

 - An AWS account with access to EC2, S3, and IAM services 
 - Terraform installed on your local machine
 - Ansible installed on your local machine 
 - A SSH key pair for accessing the EC2 instances  

## Installation  

 1. Clone this repository to your local machine
 2. Create the `terraform.tfvars` file and provide your AWS credentials and other variables (not recommended) or store your credentials in the AWS CLI with the command `aws configure`
 3. Run `terraform init` in the respective folders to initialize the Terraform state
 4. Run `terraform apply` to create the AWS resources
 5. Wait for the output to show the public IP address of the Jenkins master instance
 6. Access the Jenkins web interface using the IP address and the initial admin password from `/var/lib/jenkins/secrets/initialAdminPassword`
 7. Complete the Jenkins setup wizard and install the recommended plugins

## Usage  
  
You can use Jenkins to create and run your CI/CD pipelines. Jenkins will automatically launch and terminate EC2 instances as agents based on the demand. You can monitor the autoscaling activity from the Jenkins web interface or the AWS console.
