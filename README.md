# Tech Eazy DevOps Terraform Project

This repository contains Terraform code to deploy a Java-based application on an AWS EC2 instance with full setup using **Ubuntu 22.04**, **OpenJDK 17**, **Git**, and **Maven**. The application runs on **port 8080**.

---

## Features

- Deploys an EC2 instance with a security group allowing SSH, HTTP (80), and application port (8080) access.
- Automatically installs Java, Git, and Maven.
- Clones the specified GitHub repository and builds the application using Maven.
- Runs the application in the background on port `8080`.
- Outputs the public IP and application URL after deployment.

---

## Prerequisites

- AWS account with appropriate permissions
- Existing key pair in AWS
- Terraform installed locally (v1.0+ recommended)
- Git installed locally

---

## Terraform Files

| File         | Description                                    |
|-------------|-----------------------------------------------|
| `variables.tf` | Defines AWS region, EC2 instance type, AMI ID, key pair, subnet, and Git repo URL. |
| `main.tf`      | Contains AWS provider, Security Group, EC2 instance, and user data script. |
| `outputs.tf`   | Outputs the EC2 public IP and application URL. |

---

## Usage

1. **Clone this repository:**
   ```bash
   git clone https://github.com/karthikpyati777/tech_eazy_devops_karthikpyati777.git
   cd tech_eazy_devops_karthikpyati777

2. Initialize Terraform:
   terraform init
   
3. Apply Terraform plan:
   terraform apply
   Review the plan and type yes to deploy
   
4. Access the deployed application:
   After deployment, Terraform outputs the public IP and URL:

   instance_public_ip = <EC2_PUBLIC_IP>
               app_url= http://<EC2_PUBLIC_IP>:8080/hello


Notes:

 ---->     Application runs on port 8080. Change this in main.tf if you want a different port.

 ---->     Security group allows SSH (22), HTTP (80), and application port (8080) from all IPs (0.0.0.0/0). Adjust for production security.
   


