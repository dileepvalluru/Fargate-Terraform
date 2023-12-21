provider "aws" {
  region = "eu-west-1"
}
module "vpc" {
  source = "./networking"
}
module "iam" {
  source = "./iam"
}
module "ecs" {
  source                      = "./ecs"
  depends_on                  = [module.iam]
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  private_subnet_ids          = module.vpc.private_subnet_ids
  public_subnet_ids           = module.vpc.public_subnet_ids
  ecs_tasks_sg                = module.vpc.ecs_tasks_sg
  lb_arn                      = module.lb.lb-arn
  tg-arn                      = module.lb.tg-arn
  ecs_service_role_arn        = module.iam.ecs_service_role_arn
}
module "lb" {
  source            = "./lb"
  public_subnet_ids = module.vpc.public_subnet_ids
  nlb_sg_id         = module.vpc.NLB_Security_Group_id
}

