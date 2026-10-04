# ContentSphere — Infrastructure as Code

## Project Overview

ContentSphere is an Infrastructure as Code (IaC) project that demonstrates how cloud infrastructure can be provisioned, managed, and documented using Terraform on AWS.

The project provisions a complete AWS environment containing a VPC, subnet, Internet Gateway, route table, security group, EC2 web server, Elastic IP, and S3 bucket.

The project also includes demonstrations of AWS CloudFormation and AWS CDK.

## Technologies Used

* Terraform
* AWS
* Amazon EC2
* Amazon VPC
* Amazon S3
* Elastic IP
* Security Groups
* AWS CloudFormation
* AWS CDK
* Git
* GitHub
* Nginx
* Ubuntu Linux

## AWS Architecture

```text
                    AWS Cloud
                       |
                    VPC
                 10.0.0.0/16
                       |
              Public Subnet
                10.0.1.0/24
                       |
          +------------+------------+
          |                         |
     EC2 Web Server             Route Table
       t3.micro                     |
          |                    Internet Gateway
       Nginx                         |
          |                           |
     ContentSphere                Internet
       Website
          |
      Elastic IP

                    S3 Bucket
              ContentSphere Storage
```

## Terraform Resources

Terraform provisions:

* VPC
* Public Subnet
* Internet Gateway
* Route Table
* Route Table Association
* Security Group
* EC2 Instance
* Elastic IP
* S3 Bucket

## Terraform Modules

The project contains reusable Terraform modules:

```text
modules/
├── vpc/
├── ec2/
├── security-group/
├── elastic-ip/
└── s3/
```

Modules allow infrastructure components to be organized and reused.

## Remote State

Terraform state is configured with an Amazon S3 backend.

```text
S3
└── contentsphere/
    └── terraform.tfstate
```

The state bucket uses:

* S3 remote backend
* Versioning
* Server-side encryption
* S3 state locking

## Website Deployment

Nginx was installed on the EC2 instance and configured to serve the ContentSphere website.

The deployment flow is:

```text
Terraform
    |
    v
AWS VPC
    |
    v
EC2
    |
    v
Nginx
    |
    v
ContentSphere Website
```

## CloudFormation

The project also contains a CloudFormation implementation to demonstrate AWS-native Infrastructure as Code.

CloudFormation templates are stored in:

```text
cloudformation/
```

## AWS CDK

The project contains an AWS CDK implementation using Python.

CDK source code is stored in:

```text
cdk/
```

The CDK implementation demonstrates how infrastructure can be defined using a programming language and synthesized into CloudFormation.

> Note: The CDK portion is included as a demonstration; the Terraform implementation is the primary infrastructure deployment for this project.

## Project Structure

```text
Contentsphere/
├── cdk/
├── cloudformation/
├── documentation/
├── modules/
│   ├── ec2/
│   ├── elastic-ip/
│   ├── s3/
│   ├── security-group/
│   └── vpc/
├── screenshots/
├── main.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
├── variables.tf
└── README.md
```

## Terraform Commands

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Create an execution plan:

```bash
terraform plan
```

Deploy infrastructure:

```bash
terraform apply
```

View outputs:

```bash
terraform output
```

View Terraform state:

```bash
terraform state list
```

Destroy infrastructure:

```bash
terraform destroy
```

## Learning Outcomes

Through this project I learned:

1. Terraform installation and configuration
2. AWS provider configuration
3. Infrastructure provisioning using Terraform
4. Terraform variables and outputs
5. Terraform lifecycle operations
6. Terraform modules
7. EC2 web server deployment
8. Remote Terraform state using S3
9. Terraform state management
10. Infrastructure drift detection
11. AWS CloudFormation
12. AWS CDK
13. Comparison of Infrastructure as Code tools
14. Git and GitHub project management


