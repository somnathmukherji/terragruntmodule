resource "aws_instance" "NAT_INSTANCE" {
  ami = "${data.aws_ami.NAT_INSTANCE.id}"
  instance_type = "${var.instance_type}"
  subnet_id = "subnet-070afe3fd429c32ae"
  vpc_security_group_ids = ["sg-025c8313b52a31689"]
  #root_block_device {
   # volume_type = "standard"
    #volume_size = 8
  #}
  root_block_device {
        volume_size = var.root_volume_size
        volume_type = "standard"
      }
	  
      ebs_block_device {
        device_name = "/dev/sdf"
        volume_size = var.ebs_volume1_size
        volume_type = "gp2"
      }
    
  key_name = "${var.key_name}"
  source_dest_check = false
  tags = {
              
              "Name" : "NAT_INSTANCE"
                           
			  }
}

resource "aws_ebs_volume" "NAT_EBS1" {
	availability_zone = "ap-south-1a"
	size = var.ebs_volume1_size
}

