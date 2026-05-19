module "data_lake" {
  source = "./modules/data_lake"

  project_name       = var.project_name
  environment        = var.environment
  raw_bucket_name    = var.raw_bucket_name
  loc_bucket_name    = var.loc_bucket_name
  silver_bucket_name = var.silver_bucket_name
}

module "cold_layer" {
  source = "./modules/cold_layer"

  project_name      = var.project_name
  environment       = var.environment
  aws_region        = var.aws_region
  raw_bucket_arn    = module.data_lake.raw_bucket_arn
  silver_bucket_arn = module.data_lake.silver_bucket_arn
}

module "hot_layer" {
  source = "./modules/hot_layer"

  project_name      = var.project_name
  environment       = var.environment
  aws_region        = var.aws_region
  loc_bucket_arn    = module.data_lake.loc_bucket_arn
  silver_bucket_arn = module.data_lake.silver_bucket_arn
}

module "governance_monitoring" {
  source = "./modules/governance_monitoring"

  project_name      = var.project_name
  environment       = var.environment
  aws_region        = var.aws_region
  raw_bucket_arn    = module.data_lake.raw_bucket_arn
  loc_bucket_arn    = module.data_lake.loc_bucket_arn
  silver_bucket_arn = module.data_lake.silver_bucket_arn
}
