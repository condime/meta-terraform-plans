output "github_repository_constants" {
  value = {
    aws_identity_provider_for_circleci = aws_iam_openid_connect_provider.circleci.arn
    aws_identity_provider_for_github   = aws_iam_openid_connect_provider.github.arn
  }
}
