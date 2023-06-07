resource "aws_instance" "TERRAGRUNT1" {
  ami = "${data.aws_ami.TERRAGRUNT1.id}"
  instance_type = "${var.instance_type}"
  subnet_id = "{module.vpc.aws_subnet.public_subnet_1.id}"
  vpc_security_group_ids = [module.ec2.aws_security_group.nat_sg.id]
  root_block_device {
    volume_type = "standard"
    volume_size = 8
  }
  key_name = "${var.key_name}"
  source_dest_check = false
  tags = {
              
              "Name" : "TERRAGRUNT1"
                           
			  }
}



