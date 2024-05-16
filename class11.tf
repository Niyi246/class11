resource "aws_s3_bucket" "my_bucket" {
  bucket = "your-unique-bucket-name"

  versioning {
    enabled = true
  }
}

resource "aws_iam_bucket_policy" "allow_public_read" {
  bucket = aws_s3_bucket.my_bucket.id
  policy {
    name = "AllowPublicRead"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": [
        "arn:aws:s3:::your-unique-bucket-name/*"
      ]
    }
  ]
}
EOF
  }
}
