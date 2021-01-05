#####################################
# Allow administration for all keys
#####################################
data "aws_iam_policy_document" "all_keys_admin" {
  policy_id = "AllKeysAdministration"

  statement {
    effect = "Allow"

    actions = [
      "kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:TagResource",
      "kms:UntagResource",
      "kms:ScheduleKeyDeletion",
      "kms:CancelKeyDeletion",
    ]

    resources = [
      "arn:aws:kms:*:${local.account_id}:key/*",
    ]
  }
}

resource "aws_iam_policy" "all_keys_admin" {
  count = var.create_all_keys_policy ? 1 : 0

  name        = var.all_keys_admin_policy
  description = "Allows administration to all KMS keys in the account"
  policy      = data.aws_iam_policy_document.all_keys_admin.json
}
