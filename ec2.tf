resource "aws_instance" "NAT_INSTANCE" {
  ami = "${data.aws_ami.NAT_INSTANCE.id}"
  instance_type = "${var.instance_type}"
  subnet_id = "{subnet-070afe3fd429c32ae}"
  vpc_security_group_ids = ["sg-025c8313b52a31689"]
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



