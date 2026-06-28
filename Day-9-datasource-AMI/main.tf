# data "aws_ami" "example" {

#   most_recent = true

#   owners = ["amazon"]   # amazon | self | AWS Account ID

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*"]
#   }

#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "state"
#     values = ["available"]
#   }

#   filter {
#     name   = "platform"
#     values = ["windows"]        # Remove for Linux AMIs
#   }

#   filter {
#     name   = "owner-alias"
#     values = ["amazon"]
#   }

#   filter {
#     name   = "creation-date"
#     values = ["2026-*"]
#   }

#   filter {
#     name   = "description"
#     values = ["Amazon Linux*"]
#   }

#   filter {
#     name   = "hypervisor"
#     values = ["xen"]
#   }

#   filter {
#     name   = "ena-support"
#     values = ["true"]
#   }

#   filter {
#     name   = "boot-mode"
#     values = ["uefi"]
#   }

#   filter {
#     name   = "tag:Name"
#     values = ["MyAMI"]
#   }

#   filter {
#     name   = "tag-key"
#     values = ["Environment"]
#   }

#   filter {
#     name   = "tag-value"
#     values = ["Production"]
#   }

#   filter {
#     name   = "block-device-mapping.volume-type"
#     values = ["gp3"]
#   }

#   filter {
#     name   = "image-type"
#     values = ["machine"]
#   }

#   filter {
#     name   = "is-public"
#     values = ["true"]
#   }
# }

## Most commonly used in real projects

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}