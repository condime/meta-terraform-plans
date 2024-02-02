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
  thumbprint_list = [
    # $ tlsfingerprint token.actions.githubusercontent.com
    "3ea80e902fc385f36bc08193fbc678202d572994",

    # Intermediate Certificate
    # $ curl http://cacerts.digicert.com/DigiCertGlobalG2TLSRSASHA2562020CA1-1.crt \
    # >  | openssl x509 -inform der -fingerprint -noout \
    # >  | cut -d= -f2 | sed -e 's/://g;s/\(.*\)/\L\1/'
    "1b511abead59c6ce207077c0bf0e0043b1382612",

    # DigiCert Root
    # $ curl http://cacerts.digicert.com/DigiCertGlobalRootG2.crt \
    # >  | openssl x509 -inform der -fingerprint -noout \
    # >  | cut -d= -f2 | sed -e 's/://g;s/\(.*\)/\L\1/'
    "df3c24f9bfd666761b268073fe06d1cc8d4f82a4",
  ]

  # GitHub Org
  client_id_list = [
    "sts.amazonaws.com",
    "https://github.com/condime",
  ]
}
