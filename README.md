# terraformProjectAwsVPC
Prerequisites

An AWS account with IAM user access.
Code Editor (I used VS Code for this deployment)
Familiarity with Linux commands, scripting, and SSH.
Reference: https://registry.terraform.io/
Architecture Diagram:

This three-tier architecture will contain the following components:

Deploy a VPC with CIDR 10.0.0.0/16
Within the VPC we will have 2 public subnets with CIDR 10.0.0.0/28 and 10.0.0.16/28. Each public subnet will be in a different Availability Zone for high availability.
Create 4 private subnets with CIDR 10.0.0.32/28, 10.0.0.48/18 for the application tier and CIDR 10.0.0.64/28, 10.0.0.80/28 for the database tier and each will be in a different Availability Zone.
Deploy RDS MySQL instance.
An Application load balancer that will direct traffic to the public subnets and another application load balancer to handle traffic from the web tier to the app tier.
Deploy one EC2 auto-calling group in each public subnet(web tier)and private subnet (app tier) for high availability.
Internet Gateway, NAT gateway, and Elastic IPs for EC2 instance.
Bastion host for connecting direct app servers.




