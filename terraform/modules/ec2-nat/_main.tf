module "aws_ec2" {
  source                               = "terraform-aws-modules/ec2-instance/aws"
  version                              = "5.6.1"
  ami                                  = local.ami # data source
  ami_ssm_parameter                    = var.ami_ssm_parameter
  associate_public_ip_address          = var.associate_public_ip_address
  availability_zone                    = var.availability_zone
  capacity_reservation_specification   = var.capacity_reservation_specification
  cpu_core_count                       = var.cpu_core_count
  cpu_credits                          = var.cpu_credits
  cpu_options                          = var.cpu_options
  cpu_threads_per_core                 = var.cpu_threads_per_core
  create                               = var.create
  create_iam_instance_profile          = var.create_iam_instance_profile
  create_spot_instance                 = var.create_spot_instance
  disable_api_stop                     = var.disable_api_stop
  disable_api_termination              = var.disable_api_termination
  ebs_block_device                     = var.ebs_block_device
  ebs_optimized                        = var.ebs_optimized
  enable_volume_tags                   = var.enable_volume_tags
  enclave_options_enabled              = var.enclave_options_enabled
  ephemeral_block_device               = var.ephemeral_block_device
  get_password_data                    = var.get_password_data
  hibernation                          = var.hibernation
  host_id                              = var.host_id
  iam_instance_profile                 = var.iam_instance_profile
  iam_role_description                 = var.iam_role_description
  iam_role_name                        = var.iam_role_name
  iam_role_path                        = var.iam_role_path
  iam_role_permissions_boundary        = var.iam_role_permissions_boundary
  iam_role_policies                    = var.iam_role_policies
  iam_role_tags                        = var.iam_role_tags
  iam_role_use_name_prefix             = var.iam_role_use_name_prefix
  ignore_ami_changes                   = var.ignore_ami_changes
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_tags                        = var.instance_tags
  instance_type                        = var.instance_type
  ipv6_address_count                   = var.ipv6_address_count
  ipv6_addresses                       = var.ipv6_addresses
  key_name                             = var.key_name
  launch_template                      = var.launch_template
  maintenance_options                  = var.maintenance_options
  metadata_options                     = var.metadata_options
  monitoring                           = var.monitoring
  name                                 = var.name
  network_interface                    = var.network_interface
  placement_group                      = var.placement_group
  private_dns_name_options             = var.private_dns_name_options
  private_ip                           = var.private_ip
  root_block_device                    = var.root_block_device
  secondary_private_ips                = var.secondary_private_ips
  source_dest_check                    = var.source_dest_check
  spot_block_duration_minutes          = var.spot_block_duration_minutes
  spot_instance_interruption_behavior  = var.spot_instance_interruption_behavior
  spot_launch_group                    = var.spot_launch_group
  spot_price                           = var.spot_price
  spot_type                            = var.spot_type
  spot_valid_from                      = var.spot_valid_from
  spot_valid_until                     = var.spot_valid_until
  spot_wait_for_fulfillment            = var.spot_wait_for_fulfillment
  subnet_id                            = local.subnet_id # data source
  tags                                 = var.tags
  tenancy                              = var.tenancy
  timeouts                             = var.timeouts
  user_data                            = var.user_data
  user_data_base64                     = local.user_data_base64 # user_data.sh
  user_data_replace_on_change          = var.user_data_replace_on_change
  volume_tags                          = var.volume_tags
  vpc_security_group_ids               = local.vpc_security_group_ids
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.1"
    }
  }
}

provider "aws" {}
