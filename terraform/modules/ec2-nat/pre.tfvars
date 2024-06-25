ami = null # data source

ami_ssm_parameter = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"

associate_public_ip_address = null

availability_zone = null

capacity_reservation_specification = {}

cpu_core_count = null

cpu_credits = null

cpu_options = {}

cpu_threads_per_core = null

create = true

create_iam_instance_profile = true

create_spot_instance = false

disable_api_stop = null

disable_api_termination = false

ebs_block_device = []

ebs_optimized = null

enable_volume_tags = true

enclave_options_enabled = null

ephemeral_block_device = []

get_password_data = null

hibernation = null

host_id = null

iam_instance_profile = null

iam_role_description = null

iam_role_name = null

iam_role_path = null

iam_role_permissions_boundary = null

iam_role_policies = {
  AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

iam_role_tags = {}

iam_role_use_name_prefix = true

ignore_ami_changes = false

instance_initiated_shutdown_behavior = null

instance_tags = {}

instance_type = "t3.nano"

ipv6_address_count = null

ipv6_addresses = null

key_name = "sudo88"

launch_template = {}

maintenance_options = {}

metadata_options = {
  "http_endpoint" : "enabled",
  "http_put_response_hop_limit" : 1,
  "http_tokens" : "optional"
}

monitoring = null

name = "default-pre-nat"

network_interface = []

placement_group = null

private_dns_name_options = {}

private_ip = "148.2.101.10"

root_block_device = [{
  volume_size           = "8"
  volume_type           = "gp2"
  encrypted             = false
  delete_on_termination = true
}]

secondary_private_ips = null

source_dest_check = false

spot_block_duration_minutes = null

spot_instance_interruption_behavior = null

spot_launch_group = null

spot_price = null

spot_type = null

spot_valid_from = null

spot_valid_until = null

spot_wait_for_fulfillment = null

subnet_id = null # data source

tags = {
  "Terraform"   = "True"
  "Project"     = "default-pre"
  "Environment" = "pre"
}

tenancy = null

timeouts = {}

user_data = null

user_data_base64 = null

user_data_replace_on_change = null

volume_tags = {}

vpc_security_group_ids = null
