resource "aws_iam_policy" "meta-terraform-plans-ro" {
  name   = "meta-terraform-plans-ro"
  policy = data.aws_iam_policy_document.meta-terraform-plans-ro.json
}

data "aws_iam_policy_document" "meta-terraform-plans-ro" {
  statement {
    actions = [
      # List
      "iam:GetAccountSummary",
      "iam:GetLoginProfile",
      "iam:ListAccessKeys",
      "iam:ListAttachedGroupPolicies",
      "iam:ListAttachedRolePolicies",
      "iam:ListAttachedUserPolicies",
      "iam:ListEntitiesForPolicy",
      "iam:ListGroupPolicies",
      "iam:ListGroups",
      "iam:ListGroupsForUser",
      "iam:ListInstanceProfileTags",
      "iam:ListInstanceProfiles",
      "iam:ListInstanceProfilesForRole",
      "iam:ListMFADeviceTags",
      "iam:ListMFADevices",
      "iam:ListOpenIDConnectProviderTags",
      "iam:ListOpenIDConnectProviders",
      "iam:ListPolicies",
      "iam:ListPoliciesGrantingServiceAccess",
      "iam:ListPolicyTags",
      "iam:ListPolicyVersions",
      "iam:ListRolePolicies",
      "iam:ListRoleTags",
      "iam:ListRoles",
      "iam:ListSAMLProviderTags",
      "iam:ListSAMLProviders",
      "iam:ListSSHPublicKeys",
      "iam:ListServerCertificateTags",
      "iam:ListServerCertificates",
      "iam:ListServiceSpecificCredentials",
      "iam:ListSigningCertificates",
      "iam:ListUserPolicies",
      "iam:ListUserTags",
      "iam:ListUsers",
      "iam:ListVirtualMFADevices",

      # Read
      "iam:GenerateCredentialReport",
      "iam:GenerateOrganizationsAccessReport",
      "iam:GenerateServiceLastAccessedDetails",
      "iam:GetAccessKeyLastUsed",
      "iam:GetAccountAuthorizationDetails",
      "iam:GetAccountPasswordPolicy",
      "iam:GetContextKeysForCustomPolicy",
      "iam:GetContextKeysForPrincipalPolicy",
      "iam:GetCredentialReport",
      "iam:GetGroup",
      "iam:GetGroupPolicy",
      "iam:GetInstanceProfile",
      "iam:GetOpenIDConnectProvider",
      "iam:GetOrganizationsAccessReport",
      "iam:GetPolicy",
      "iam:GetPolicyVersion",
      "iam:GetRole",
      "iam:GetRolePolicy",
      "iam:GetSAMLProvider",
      "iam:GetSSHPublicKey",
      "iam:GetServerCertificate",
      "iam:GetServiceLastAccessedDetails",
      "iam:GetServiceLastAccessedDetailsWithEntities",
      "iam:GetServiceLinkedRoleDeletionStatus",
      "iam:GetUser",
      "iam:GetUserPolicy",
      "iam:SimulateCustomPolicy",
      "iam:SimulatePrincipalPolicy",
    ]

    resources = ["*"]
  }
}
