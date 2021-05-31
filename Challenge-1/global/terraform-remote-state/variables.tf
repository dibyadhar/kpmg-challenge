/*
  * Variables
*/

variable "bucket_name" {
  description = "Unique Name of the S3 bucket"
  type        = string
  default     = "kpmg-proj-remote-state"

}

variable "bucket_acl" {
  description = "ACL for the S3 bucket, default is private"
  type        = string
  default     = "private"

}

variable "tag_owner" {
  type        = string
  description = "Collection of project related tag"
  default     = "KPMG"
}

variable "tag_role" {
  type        = string
  description = "Role of the bucket"
  default     = "Store terraform state"
}

variable "tag_costcenter" {
  type        = string
  description = "Role of the bucket"
  default     = "112233"
}


