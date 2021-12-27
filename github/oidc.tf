# Setup a Federated IAM OIDC Provider between GitHub and AWS
resource "aws_iam_openid_connect_provider" "github" {
  # GitHub Actions Issuer Url
  url = "https://token.actions.githubusercontent.com"

  # Issued by DigiCert Inc, Valid from 10/22/2013 until 10/22/2028
  thumbprint_list = ["a031c46782e6e6c662c2c87c76da9aa62ccabd8e"]

  # GitHub Org
  client_id_list = [
    "https://github.com/condime",
  ]
}
