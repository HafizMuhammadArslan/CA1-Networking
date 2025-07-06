provider "aws" {
  region     = "us-east-1"
  access_key = "your-access-key"
  secret_key = "your-secret-key"
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo docker run -d -p 80:80 nginx
              EOF

  tags = {
    Name = "CA1-Docker-Web"
  }
}
