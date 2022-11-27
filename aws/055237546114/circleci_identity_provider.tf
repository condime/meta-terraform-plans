# Setup a Federated IAM OIDC Provider between CircleCI and AWS
resource "aws_iam_openid_connect_provider" "circleci" {
  ## CircleCI Issuer Url for bencord0
  #url = "https://oidc.circleci.com/org/d47b1101-776f-4469-81d4-b737ae7ed122"
  # CircleCI Issuer Url for condime
  url = "https://oidc.circleci.com/org/59214151-d3e1-44ba-8cfc-736fc1cc7176"

  # Issued by Amazon, Valid from 2021-10-24 until 2022-11-22
  #
  # $ function tlsfingerprint() {
  # > openssl s_client -servername "${1}" -showcerts -connect "${1}:443" </dev/null 2>/dev/null \
  # > | openssl x509 -fingerprint -noout \
  # > | cut -d= -f2 | sed -e 's/://g;s/\(.*\)/\L\1/'
  # > }
  #
  # $ tlsfingerprint oidc.circleci.com
  thumbprint_list = ["c510b3d1652c4d8b71b64911fb377d4d788c3a5a"]

  client_id_list = [
    # condime org
    "59214151-d3e1-44ba-8cfc-736fc1cc7176",
  ]
}
