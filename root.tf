module "github" {
  source = "./github"

  github_repository_constants = module.aws_condime.github_repository_constants
}

# This is the condi.me AWS subaccount
module "aws_condime" {
  source = "./aws/055237546114"
}

# This is the condime project
module "circleci_condime" {
  source = "./circleci/condime"

  circleci_project_constants = module.aws_condime.circleci_project_constants
}
