resource "aws_s3_bucket" "providers" {
  bucket = "s3-providers"
  tags = {
    env         = "dev"
    description = "S3 bucket testing"
  }
}
