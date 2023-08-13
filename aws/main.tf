module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["master", "node1", "node2"])

  name = "instance-${each.key}"

  instance_type          = "t2.micro"
  key_name               = "k8s"
  # monitoring             = true
  vpc_security_group_ids = ["sg-0b6982d5e65dec5bc"]
  # subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
