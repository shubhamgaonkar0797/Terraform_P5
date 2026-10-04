data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "contentsphere_bucket" {
  bucket = "contentsphere-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "contentsphere-bucket"
    Project     = "ContentSphere"
    Environment = "dev"
  }
}
