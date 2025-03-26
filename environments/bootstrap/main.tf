# main.tf content
module "backend" {
  source              = "../../modules/backend"
  s3_bucket_name      = "t2s-fintech-terraform-state"
  dynamodb_table_name = "t2s-terraform-locks"
}