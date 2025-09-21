##############################
# Terraform Main File
##############################

provider "aws" {
  region = var.aws_region
}

# Security Group
resource "aws_security_group" "app_sg" {
  name        = "app-sg-${var.stage}"
  description = "Allow SSH and HTTP traffic"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  associate_public_ip_address = true

  tags = {
    Name  = "techeazy-${var.stage}-server"
    Stage = var.stage
  }




  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y openjdk-17-jdk git maven

              cd /home/ubuntu
              git clone ${var.repo_url} app
              cd app

              mvn clean package -DskipTests

              # Run app on port 8080 as root
              sudo nohup java -jar target/*.jar --server.port=8080 > app.log 2>&1 &
              EOF


}


