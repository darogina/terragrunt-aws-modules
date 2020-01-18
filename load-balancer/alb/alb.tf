data "aws_subnet_ids" "selected" {
  vpc_id = data.terraform_remote_state.environment_vpc.outputs.vpc_id

  tags = {
    Name = "*-${var.subnet_name}"
  }
}

resource "aws_security_group" "alb" {
  name   = "lb_allow_http_https_from_internet"
  vpc_id = data.terraform_remote_state.environment_vpc.outputs.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
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
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = data.aws_subnet_ids.selected.ids

  access_logs {
    bucket  = data.terraform_remote_state.master.outputs.audit_logs_bucket_id
    prefix  = "alb/${lower(var.account_name)}/${var.alb_name}"
    enabled = true
  }
}
