variable "CI_ENVIRONMENT_NAME" {
  type        = string
  description = "Project Environment (Required)"
  default     = "dev"
}

variable "CF_CLOUDFLARED_TOKEN" {
  type        = string
  description = "Cloudflared registration token (Required)"
  default     = null
}

variable "ami" {
  type        = string
  description = "ID of AMI to use for the instance"
  default     = null
}

variable "ami_ssm_parameter" {
  type        = string
  description = "SSM parameter name for the AMI ID. For Amazon Linux AMI SSM parameters see [reference](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-public-parameters-ami.html)"
  default     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP address with an instance in a VPC"
  default     = null
}

variable "availability_zone" {
  type        = string
  description = "AZ to start the instance in"
  default     = null
}

variable "capacity_reservation_specification" {
  type        = any
  description = "Describes an instance's Capacity Reservation targeting option"
  default     = {}
}

variable "cpu_core_count" {
  type        = number
  description = "Sets the number of CPU cores for an instance"
  default     = null
}

variable "cpu_credits" {
  type        = string
  description = "The credit option for CPU usage (unlimited or standard)"
  default     = null
}

variable "cpu_options" {
  type        = any
  description = "Defines CPU options to apply to the instance at launch time."
  default     = {}
}

variable "cpu_threads_per_core" {
  type        = number
  description = "Sets the number of CPU threads per core for an instance (has no effect unless cpu_core_count is also set)"
  default     = null
}

variable "create" {
  type        = bool
  description = "Whether to create an instance"
  default     = true
}

variable "create_iam_instance_profile" {
  type        = bool
  description = "Determines whether an IAM instance profile is created or to use an existing IAM instance profile"
  default     = false
}

variable "create_spot_instance" {
  type        = bool
  description = "Depicts if the instance is a spot instance"
  default     = false
}

variable "disable_api_stop" {
  type        = bool
  description = "If true, enables EC2 Instance Stop Protection"
  default     = null
}

variable "disable_api_termination" {
  type        = bool
  description = "If true, enables EC2 Instance Termination Protection"
  default     = null
}

variable "ebs_block_device" {
  type        = list(any)
  description = "Additional EBS block devices to attach to the instance"
  default     = []
}

variable "ebs_optimized" {
  type        = bool
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = null
}

variable "enable_volume_tags" {
  type        = bool
  description = "Whether to enable volume tags (if enabled it conflicts with root_block_device tags)"
  default     = true
}

variable "enclave_options_enabled" {
  type        = bool
  description = "Whether Nitro Enclaves will be enabled on the instance. Defaults to `false`"
  default     = null
}

variable "ephemeral_block_device" {
  type        = list(map(string))
  description = "Customize Ephemeral (also known as Instance Store) volumes on the instance"
  default     = []
}

variable "get_password_data" {
  type        = bool
  description = "If true, wait for password data to become available and retrieve it"
  default     = null
}

variable "hibernation" {
  type        = bool
  description = "If true, the launched EC2 instance will support hibernation"
  default     = null
}

variable "host_id" {
  type        = string
  description = "ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host"
  default     = null
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  default     = null
}

variable "iam_role_description" {
  type        = string
  description = "Description of the role"
  default     = null
}

variable "iam_role_name" {
  type        = string
  description = "Name to use on IAM role created"
  default     = null
}

variable "iam_role_path" {
  type        = string
  description = "IAM role path"
  default     = null
}

variable "iam_role_permissions_boundary" {
  type        = string
  description = "ARN of the policy that is used to set the permissions boundary for the IAM role"
  default     = null
}

variable "iam_role_policies" {
  type        = map(string)
  description = "Policies attached to the IAM role"
  default     = {}
}

variable "iam_role_tags" {
  type        = map(string)
  description = "A map of additional tags to add to the IAM role/profile created"
  default     = {}
}

variable "iam_role_use_name_prefix" {
  type        = bool
  description = "Determines whether the IAM role name (`iam_role_name` or `name`) is used as a prefix"
  default     = true
}

variable "ignore_ami_changes" {
  type        = bool
  description = "Whether changes to the AMI ID changes should be ignored by Terraform. Note - changing this value will result in the replacement of the instance"
  default     = false
}

variable "instance_initiated_shutdown_behavior" {
  type        = string
  description = "Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instance"
  default     = null
}

variable "instance_tags" {
  type        = map(string)
  description = "Additional tags for the instance"
  default     = {}
}

variable "instance_type" {
  type        = string
  description = "The type of instance to start"
  default     = "t3.micro"
}

variable "ipv6_address_count" {
  type        = number
  description = "A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet"
  default     = null
}

variable "ipv6_addresses" {
  type        = list(string)
  description = "Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
  default     = null
}

variable "key_name" {
  type        = string
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  default     = null
}

variable "launch_template" {
  type        = map(string)
  description = "Specifies a Launch Template to configure the instance. Parameters configured on this resource will override the corresponding parameters in the Launch Template"
  default     = {}
}

variable "maintenance_options" {
  type        = any
  description = "The maintenance options for the instance"
  default     = {}
}

variable "metadata_options" {
  type        = map(string)
  description = "Customize the metadata options of the instance"
  default = {
    "http_endpoint" : "enabled",
    "http_put_response_hop_limit" : 1,
    "http_tokens" : "optional"
  }
}

variable "monitoring" {
  type        = bool
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = null
}

variable "name" {
  type        = string
  description = "Name to be used on EC2 instance created"
  default     = ""
}

variable "network_interface" {
  type        = list(map(string))
  description = "Customize network interfaces to be attached at instance boot time"
  default     = []
}

variable "placement_group" {
  type        = string
  description = "The Placement Group to start the instance in"
  default     = null
}

variable "private_dns_name_options" {
  type        = map(string)
  description = "Customize the private DNS name options of the instance"
  default     = {}
}

variable "private_ip" {
  type        = string
  description = "Private IP address to associate with the instance in a VPC"
  default     = null
}

variable "root_block_device" {
  type        = list(any)
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  default     = []
}

variable "secondary_private_ips" {
  type        = list(string)
  description = "A list of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC. Can only be assigned to the primary network interface (eth0) attached at instance creation, not a pre-existing network interface i.e. referenced in a `network_interface block`"
  default     = null
}

variable "source_dest_check" {
  type        = bool
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs"
  default     = null
}

variable "spot_block_duration_minutes" {
  type        = number
  description = "The required duration for the Spot instances, in minutes. This value must be a multiple of 60 (60, 120, 180, 240, 300, or 360)"
  default     = null
}

variable "spot_instance_interruption_behavior" {
  type        = string
  description = "Indicates Spot instance behavior when it is interrupted. Valid values are `terminate`, `stop`, or `hibernate`"
  default     = null
}

variable "spot_launch_group" {
  type        = string
  description = "A launch group is a group of spot instances that launch together and terminate together. If left empty instances are launched and terminated individually"
  default     = null
}

variable "spot_price" {
  type        = string
  description = "The maximum price to request on the spot market. Defaults to on-demand price"
  default     = null
}

variable "spot_type" {
  type        = string
  description = "If set to one-time, after the instance is terminated, the spot request will be closed. Default `persistent`"
  default     = null
}

variable "spot_valid_from" {
  type        = string
  description = "The start date and time of the request, in UTC RFC3339 format(for example, YYYY-MM-DDTHH:MM:SSZ)"
  default     = null
}

variable "spot_valid_until" {
  type        = string
  description = "The end date and time of the request, in UTC RFC3339 format(for example, YYYY-MM-DDTHH:MM:SSZ)"
  default     = null
}

variable "spot_wait_for_fulfillment" {
  type        = bool
  description = "If set, Terraform will wait for the Spot Request to be fulfilled, and will throw an error if the timeout of 10m is reached"
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "The VPC Subnet ID to launch in"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "tenancy" {
  type        = string
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host"
  default     = null
}

variable "timeouts" {
  type        = map(string)
  description = "Define maximum timeout for creating, updating, and deleting EC2 instance resources"
  default     = {}
}

variable "user_data" {
  type        = string
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead"
  default     = null
}

variable "user_data_base64" {
  type        = string
  description = "Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption"
  default     = null
}

variable "user_data_replace_on_change" {
  type        = bool
  description = "When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true. Defaults to false if not set"
  default     = null
}

variable "volume_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the devices created by the instance at launch time"
  default     = {}
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs to associate with"
  default     = null
}
