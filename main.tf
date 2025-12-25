module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
  tags        = var.tags
}

module "cloudfront" {
  source             = "./modules/cloudfront"
  origin_domain_name = module.s3_bucket.website_endpoint
  origin_id          = "${var.project_name}-origin"
  tags               = var.tags
}
