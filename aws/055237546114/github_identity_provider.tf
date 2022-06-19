# Setup a Federated IAM OIDC Provider between GitHub and AWS
resource "aws_iam_openid_connect_provider" "github" {
  # GitHub Actions Issuer Url
  url = "https://token.actions.githubusercontent.com"

  # Issued by DigiCert Inc, Valid from 10/22/2013 until 10/22/2028
  # $ openssl s_client -servername token.actions.githubusercontent.com \
  #     -showcerts -connect token.actions.githubusercontent.com:443 \
  #     | openssl x509 -fingerprint -noout \
  #     | cut -d'=' -f 2 | sed -e 's/://g'
  thumbprint_list = ["15e29108718111e59b3dad31954647e3c344a231"]

  # GitHub Org
  client_id_list = [
    "https://github.com/condime",
  ]
}
