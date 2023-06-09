resource "aws_instance" "NAT_INSTANCE" {
  ami = "${data.aws_ami.NAT_INSTANCE.id}"
  instance_type = "${var.instance_type}"
  subnet_id = "subnet-070afe3fd429c32ae"
  vpc_security_group_ids = ["sg-025c8313b52a31689"]
  #root_block_device {
   # volume_type = "standard"
    #volume_size = 8
  #}
  root_volumes = [
    {
      encrypted   = false
      type        = "standard"
      size        = 8
      delete_term = true
      throughput  = 128
    }
  ]
  ebs_volumes = [
    {
      encrypted   = false
      type        = "gp2"
      size        = 8
      device_name = "sdf"
      delete_term = true
      throughput  = 128
    },
    {
      encrypted   = true
      type        = "gp3"
      size        = 6
      device_name = "xvdc"
      delete_term = true
      throughput  = 128
    },
    {
      encrypted   = true
      type        = "gp3"
      size        = 3
      device_name = "xvdf"
      delete_term = true
      throughput  = 125
    },
    {
      encrypted   = true
      type        = "gp3"
      size        = 2
      device_name = "xvdg"
      delete_term = true
      throughput  = 125
    }
  ]
  key_name = "${var.key_name}"
  source_dest_check = false
  tags = {
              
              "Name" : "NAT_INSTANCE"
                           
			  }
}



