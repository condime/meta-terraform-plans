resource "aws_iam_policy" "terraform-plans" {
  name   = "terraform-plans"
  policy = data.aws_iam_policy_document.terraform-plans.json
}

data "aws_iam_policy_document" "terraform-plans" {
  # Deny updating our own role
  statement {
    effect = "Deny"
    actions = [
      "iam:CreateRole",
      "iam:DeleteRole",
      "iam:UpdateRole",
    ]

    resources = [
      "arn:aws:iam::055237546114:role/terraform-plan",
      "arn:aws:iam::055237546114:role/terraform-plan-ro",
    ]
  }

  statement {
    actions = [
      # S3 Tagging
      "s3:DeleteObjectTagging",
      "s3:DeleteObjectVersionTagging",
      "s3:PutBucketTagging",
      "s3:PutObjectTagging",
      "s3:PutObjectVersionTagging",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "cognito-idp:TagResource",
      "cognito-idp:UntagResource",

      "cognito-idp:CreateUserPool",
      "cognito-idp:CreateUserPoolClient",
      "cognito-idp:CreateUserPoolDomain",
      "cognito-idp:CreateIdentityProvider",
      "cognito-idp:CreateGroup",

      "cognito-idp:DeleteUserPool",
      "cognito-idp:DeleteUserPoolClient",
      "cognito-idp:DeleteUserPoolDomain",
      "cognito-idp:DeleteIdentityProvider",
      "cognito-idp:DeleteGroup",
      "cognito-idp:DeleteUser",

      "cognito-idp:UpdateGroup",
      "cognito-idp:UpdateIdentityProvider",
      "cognito-idp:UpdateUserPool",
      "cognito-idp:UpdateUserPoolClient",
      "cognito-idp:UpdateUserPoolDomain",

      "iam:CreateOpenIDConnectProvider",
      "iam:DeleteOpenIDConnectProvider",
      "iam:UpdateOpenIDConnectProviderThumbprint",

      "iam:TagOpenIDConnectProvider",
      "iam:UntagOpenIDConnectProvider",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "ecr-public:CreateRepository",
      "ecr-public:DeleteRepository",

      "ecr-public:PutRegistryCatalogData",
      "ecr-public:PutRepositoryCatalogData",

      "ecr-public:SetRepositoryPolicy",
      "ecr-public:DeleteRepositoryPolicy",

      "ecr-public:TagResource",
      "ecr-public:UntagResource",
    ]

    resources = ["*"]
  }
}
