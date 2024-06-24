locals {
  aws_region          = "ap-south-1"
  aws_bucket          = "sudo88com-tfs"
  aws_dynamodb_table  = "sudo88com-tfs"
  aws_project_name    = "default-nat"
  ci_environment_name = get_env("TF_VAR_CI_ENVIRONMENT_NAME")
}

remote_state {
  backend = "s3"
  generate = {
    path      = "remote_state.tf"
    if_exists = "overwrite"
  }
  config = {
    region         = local.aws_region
    bucket         = local.aws_bucket
    dynamodb_table = local.aws_dynamodb_table
    key            = "${get_aws_account_id()}/${local.aws_region}/${local.aws_project_name}/${local.ci_environment_name}/${path_relative_to_include()}/terraform.tfstate"
    encrypt        = true
  }
}
