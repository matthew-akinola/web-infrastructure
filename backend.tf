#backend s3 configuration
resource "aws_s3_bucket" "django_k8s_terraform_state" {
  bucket        = "backend-s3-bucket"
  force_destroy = true
}

#Uncomment this section after initializing your terraform to create necessary dependencies
# terraform {
#   backend "s3" {
#     bucket         = "backend-s3-bucket"
#     key            = "terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform_locks"
#     encrypt        = true
#   }
# }

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.django_k8s_terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable versioning so we can see the full revision history of our state files
resource "aws_s3_bucket_versioning" "version" {
  bucket = aws_s3_bucket.django_k8s_terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

#enabling s3 server side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "k8s_backend_encryption" {
  bucket = aws_s3_bucket.django_k8s_terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#dynamo DB configuration to store terraform state
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

