module "github" {
  source = "./github"

  github_repository_constants = module.aws_condime.github_repository_constants
}

# This is the condi.me AWS subaccount
module "aws_condime" {
  source = "./aws/055237546114"
}
