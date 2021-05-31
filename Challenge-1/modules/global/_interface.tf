/*
  * Variables
*/

variable "bucket_name" {
  description = "Unique Name of the S3 bucket"
  type        = string

}

variable "bucket_acl" {
  description = "ACL for the S3 bucket, default is private"
  type        = string

}

variable "tag_owner" {
  type        = string
  description = "Collection of project related tag"
}

variable "tag_role" {
  type        = string
  description = "Role of the bucket"
}

variable "tag_costcenter" {
  type        = string
  description = "Role of the bucket"
}

/*
   *Outputs
*/
output "bucket_name" {

  value = aws_s3_bucket.this.id
}

output "bucket_arn" {

  value = aws_s3_bucket.this.arn
}
