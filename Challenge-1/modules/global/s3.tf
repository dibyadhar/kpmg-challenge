

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.bucket_acl

  versioning {
    enabled = true
  }


  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {

        sse_algorithm = "AES256"
      }
    }
  }


    tags =  {
      
      Owner       = var.tag_owner
      Role        = var.tag_role
      Costcenter  = var.tag_costcenter
    }
  

}
