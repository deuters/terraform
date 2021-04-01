provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "terraform" {
  ami = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  key_name = "awskey"
  vpc_security_group_ids = [aws_security_group.terraform.id]
  connection  {
    host = self.public_ip
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/Course/secret/awskey")
  }

  provisioner "file" {
   source      = "~/Course/terraform/script.sh"
   destination = "/tmp/script.sh"
   connection {
     timeout = "1m"
     type = "ssh"
     user = "ubuntu"
     private_key = file("~/Course/secret/awskey")
   }  
 }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
  }

}

resource "aws_security_group" "terraform"{

  name        = "aws_remote_SG"

  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
