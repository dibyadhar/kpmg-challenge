/*
   *Outputs
*/
output "tf_state_bucket_name" {

  value = module.terraform_state_bucket.bucket_name
}

output "tf_state_bucket_arn" {

  value = module.terraform_state_bucket.bucket_arn
}
