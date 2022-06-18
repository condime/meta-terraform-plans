# Setup a Federated IAM OIDC Provider between CircleCI and AWS
resource "aws_iam_openid_connect_provider" "circleci" {
  ## CircleCI Issuer Url for bencord0
  #url = "https://oidc.circleci.com/org/d47b1101-776f-4469-81d4-b737ae7ed122"
  # CircleCI Issuer Url for condime
  url = "https://oidc.circleci.com/org/59214151-d3e1-44ba-8cfc-736fc1cc7176"

  # Issued by Amazon, Valid from 2021-10-24 until 2022-11-22
  # $ openssl s_client -servername oidc.circleci.com \
  #     -showcerts -connect oidc.circleci.com:443 \
  #     | openssl x509 -fingerprint -noout \
  #     | cut -d'=' -f 2 | sed -e 's/://g'
  thumbprint_list = ["A40F8D2DB9C4E8F101A80FDAD0AAEBF50C5F4191"]

  client_id_list = [
    # condime org
    "59214151-d3e1-44ba-8cfc-736fc1cc7176",
  ]
}
