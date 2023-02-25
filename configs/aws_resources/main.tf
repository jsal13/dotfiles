resource "aws_s3_bucket" "bucket" {
  bucket = "james-salvatore-leaf-room-podcast"
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}
