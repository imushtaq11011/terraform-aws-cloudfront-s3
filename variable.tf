variable "project_name" {
  type    = string
  default = "cloudfront-s3-project"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "s3_bucket_name" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}
