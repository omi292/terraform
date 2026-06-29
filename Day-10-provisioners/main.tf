# ###############################################################################
# # TERRAFORM BLOCK
# ###############################################################################

# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }

# ###############################################################################
# # AWS PROVIDER
# ###############################################################################

# provider "aws" {
#   region = "ap-south-1"
# }

###############################################################################
# SECURITY GROUP
# Allows SSH so Terraform can connect to the EC2 instance.
###############################################################################

resource "aws_security_group" "demo_sg" {

  name = "terraform-provisioner-sg"

  ingress {
    description = "Allow SSH"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]   # For Learning Only
  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

###############################################################################
# EC2 INSTANCE
###############################################################################

resource "aws_instance" "demo" {

  # Change the AMI if required
  ami = "ami-0bc7aabcf58d1e02a"

  instance_type = "t3.micro"

  # Replace with your Key Pair name
  key_name = "test"

  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  ###########################################################################
  # CONNECTION BLOCK
  # Used by file and remote-exec provisioners.
  ###########################################################################

  connection {

    type = "ssh"

    user = "ec2-user"

    # Option 1 (Recommended if test.pem is in same folder)
    private_key = file("C:/Users/truec/Downloads/test.pem")

    # Option 2 (If key is elsewhere)
    # private_key = file("C:/Users/truec/Downloads/test.pem")

    host = self.public_ip
  }

  ###########################################################################
  # PROVISIONER 1 : LOCAL-EXEC
  #
  # Runs on YOUR LOCAL MACHINE.
  ###########################################################################

  provisioner "local-exec" {

    command = "echo EC2 Public IP : ${self.public_ip} > ec2-ip.txt"

  }

  ###########################################################################
  # PROVISIONER 2 : FILE
  #
  # Copies hello.txt from your computer to EC2.
  ###########################################################################

  provisioner "file" {

    source = "hello.txt"

    destination = "/home/ec2-user/hello.txt"

  }

  ###########################################################################
  # PROVISIONER 3 : REMOTE-EXEC
  #
  # Runs commands inside EC2.
  ###########################################################################

  provisioner "remote-exec" {

    inline = [

      "echo '========== Provisioner Started =========='",

      "hostname",

      "date",

      "pwd",

      "mkdir terraform-demo",

      "touch terraform-demo/test.txt",

      "echo 'Hello from Terraform Remote Exec' > terraform-demo/test.txt",

      "cat terraform-demo/test.txt",

      "ls -l terraform-demo",

      "echo '========== Provisioner Completed =========='"

    ]
  }

  tags = {

    Name = "Provisioner-Demo"

  }

}

###############################################################################
# OUTPUT
###############################################################################

output "public_ip" {

  value = aws_instance.demo.public_ip

}

###############################################################################
# NULL RESOURCE WITH TRIGGERS (REAL DEVOPS STYLE)
###############################################################################

terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

###############################################################################
# NULL RESOURCE
###############################################################################

resource "null_resource" "demo" {

  ###########################################################################
  # TRIGGERS BLOCK
  #
  # If ANY value inside triggers changes → resource is recreated
  ###########################################################################

#   triggers = {
#     build_time = timestamp()
#     file_name  = "demo.txt"
#   }

  ###########################################################################
  # LOCAL EXEC 1
  ###########################################################################

  provisioner "local-exec" {
    command = "echo Build started at %date% %time% > demo.txt"
  }

  ###########################################################################
  # LOCAL EXEC 2
  ###########################################################################

  provisioner "local-exec" {
    command = "echo Terraform null_resource executed >> demo.txt"
  }
}

###############################################################################
# OUTPUT
###############################################################################

output "status" {
  value = "Null resource with triggers executed"
}

