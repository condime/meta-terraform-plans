resource "aws_iam_policy" "terraform-plans-ro" {
  name   = "terraform-plans-ro"
  policy = data.aws_iam_policy_document.terraform-plans-ro.json
}

data "aws_iam_policy_document" "terraform-plans-ro" {
  statement {
    actions = [
      "iam:GetUser",
      "iam:GetRole",
      "iam:GetRolePolicy",
      "iam:GetGroup",
      "iam:ListAccessKeys",
      "iam:ListAttachedRolePolicies",
      "iam:ListRolePolicies",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "kms:DescribeKey",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "cognito-idp:ListIdentityProviders",
      "cognito-idp:ListTagsForResource",
      "cognito-idp:ListUserPools",
      "cognito-idp:ListUserPoolClients",
      "cognito-idp:ListUsers",
      "cognito-idp:ListGroups",
      "cognito-idp:ListUsersInGroup",

      "cognito-idp:DescribeIdentityProvider",
      "cognito-idp:DescribeUserPool",
      "cognito-idp:DescribeUserPoolClient",
      "cognito-idp:DescribeUserPoolDomain",
      "cognito-idp:GetUser",
      "cognito-idp:GetGroup",

      "cognito-idp:GetIdentityProviderByIdentifier",
      "cognito-idp:GetUserPoolMfaConfig",

      "iam:ListOpenIDConnectProviders",
      "iam:ListOpenIDConnectProviderTags",
      "iam:GetOpenIDConnectProvider",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "ec2:DescribeAddresses",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeImages",
      "ec2:DescribeVpcs",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "ecr-public:DescribeImageTags",
      "ecr-public:DescribeRegistries",
      "ecr-public:DescribeRepositories",
      "ecr-public:DescribeImages",
      "ecr-public:GetRegistryCatalogData",
      "ecr-public:GetRepositoryCatalogData",
      "ecr-public:GetRepositoryPolicy",
      "ecr-public:ListTagsForResource",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "ecs:DescribeClusters",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "s3:ListAllMyBuckets",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "logs:DescribeLogGroups",
    ]

    resources = ["*"]
  }
}
