data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name_unique

  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "alb_log_delivery" {
  bucket = aws_s3_bucket.my_bucket.id
  policy = data.aws_iam_policy_document.allow_alb_log_delivery.json
}

data "aws_iam_policy_document" "allow_alb_log_delivery" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["logdelivery.elasticloadbalancing.amazonaws.com"]
    }

    actions = ["s3:PutObject"]

    resources = [
      "${aws_s3_bucket.my_bucket.arn}/alb-logs/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
    ]
  }
}