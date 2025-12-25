output "s3_bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "s3_website_endpoint" {
  value = module.s3_bucket.website_endpoint
}

output "cloudfront_domain_name" {
  value = module.cloudfront.domain_name
}
