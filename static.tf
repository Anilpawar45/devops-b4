# provider "aws" {
#   region = "ap-south-1"
# }

# variable "bucket_name" {
#   default = "anilpawar200"
# }

# resource "aws_s3_bucket" "website_bucket" {
#   bucket = var.bucket_name
# }

# resource "aws_s3_bucket_ownership_controls" "ownership" {
#   bucket = aws_s3_bucket.website_bucket.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "public_access" {
#   bucket = aws_s3_bucket.website_bucket.id

#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# resource "aws_s3_bucket_website_configuration" "website" {
#   bucket = aws_s3_bucket.website_bucket.id

#   index_document {
#     suffix = "index.html"
#   }
# }
# resource "aws_s3_bucket_policy" "public_read" {
#   bucket = aws_s3_bucket.website_bucket.id
#   depends_on = [
#     aws_s3_bucket_public_access_block.public_access
#   ]

#   policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "PublicReadGetObject",
#       "Effect": "Allow",
#       "Principal": "*",
#       "Action": "s3:GetObject",
#       "Resource": "arn:aws:s3:::${var.bucket_name}/*"
#     }
#   ]
# }
# POLICY
# }
# resource "aws_s3_object" "index_html" {
#   bucket = aws_s3_bucket.website_bucket.id
#   key    = "index.html"
#   source = "index.html"
#   acl    = "public-read"
#   content_type = "text/html"
#   depends_on = [aws_s3_bucket_policy.public_read]
# }
# resource "local_file" "index_html" {
#   content  = "<html><body><h1>Welcome to My Static Website</h1></body></html>"
#   filename = "index.html"
# }