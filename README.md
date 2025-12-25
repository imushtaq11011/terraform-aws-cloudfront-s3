# CloudFront + S3 Static Website Deployment using Terraform

## Project Overview

This project demonstrates a fully automated **Infrastructure as Code (IaC)** setup using **Terraform** to deploy a **static website** on AWS.  
It leverages **S3 for website hosting** and **CloudFront as CDN** for high availability and low latency delivery.  

Key features include:

- Automated creation of S3 bucket for static website
- Automatic upload of local website files (HTML, CSS, JS)
- CloudFront distribution with edge caching
- HTTPS support via CloudFront default certificate
- Configurable tags and environment setup

---

## Architecture Diagram

      +----------------+
      |   CloudFront   |
      |   Distribution |
      +--------+-------+
               |
               v
      +----------------+
      |      S3        |
      |   Website      |
      +----------------+
               |
               v
      Users (Global Access)


---

## Terraform Modules

### 1. **S3 Module**

- Creates an **S3 bucket** with website hosting enabled
- Automatically uploads **local website files** using `aws_s3_bucket_object`
- Sets **public-read ACL** for static website accessibility
- Manages **bucket policies** and **public access block settings**
- Outputs:
  - `bucket_name`
  - `website_endpoint`

### 2. **CloudFront Module**

- Creates **CloudFront distribution** with S3 bucket as origin
- Configures **default cache behavior** with GET/HEAD methods
- Enforces **HTTPS with redirect from HTTP**
- Sets **TTL caching** (default: 7 days)
- Outputs:
  - `distribution_id`
  - `domain_name`

---

## Folder Structure

terraform-root/
├─ main.tf # Root Terraform file calling modules
├─ variables.tf # Root variables
├─ outputs.tf # Root outputs
├─ terraform.tfvars # Variable values
├─ website/ # Local static website files
│ ├─ index.html
│ └─ style.css
└─ modules/
├─ s3/
│ ├─ main.tf
│ ├─ variables.tf
│ └─ outputs.tf
└─ cloudfront/
├─ main.tf
├─ variables.tf
└─ outputs.tf



---

## Deployment Steps

1. Clone the repository:

```bash
git clone <your-repo-url>
cd <repo-folder>
Place your static website files inside the website/ folder.

Initialize Terraform:
terraform init
Review planned resources:

bash
Copy code
terraform plan
Apply the configuration:

bash
Copy code
terraform apply
Confirm with yes when prompted.

Terraform will create S3 bucket, upload files, and configure CloudFront distribution.

After successful apply, check outputs:

bash
Copy code
terraform output
cloudfront_domain_name → Live website URL

s3_website_endpoint → S3 direct website endpoint

Notes
AWS Account Verification: CloudFront requires verified AWS accounts. New accounts may need support verification.

Public Access: Ensure S3 Block Public Access is disabled for static website hosting.

File Updates: To update website files, modify website/ content and re-run terraform apply.

Tags and Environment
All resources can be tagged and environment can be specified in terraform.tfvars:

hcl
Copy code
tags = {
  Project     = "CloudFrontS3"
  Environment = "Dev"
  Owner       = "MK Pro"
}
Benefits
Fully automated deployment using Terraform (IaC)

Global content delivery with CloudFront edge caching

Easy updates by modifying local files

Reproducible and version-controlled infrastructure

Author
MUSHTAQ KHAN
Cloud Engineer
