# Setup a Federated IAM OIDC Provider between GitHub and AWS
resource "aws_iam_openid_connect_provider" "github" {
  # GitHub Actions Issuer Url
  url = "https://token.actions.githubusercontent.com"

  # Issued by DigiCert Inc, Valid from 10/22/2013 until 10/22/2028
  #
  # $ function tlsfingerprint() {
  # > openssl s_client -servername "${1}" -showcerts -connect "${1}:443" </dev/null 2>/dev/null \
  # > | openssl x509 -fingerprint -noout \
  # > | cut -d= -f2 | sed -e 's/://g;s/\(.*\)/\L\1/'
  # > }
  #
  # $ tlsfingerprint token.actions.githubusercontent.com
  thumbprint_list = ["f879abce0008e4eb126e0097e46620f5aaae26ad"]

  # GitHub Org
  client_id_list = [
    "https://github.com/condime",
  ]
}
