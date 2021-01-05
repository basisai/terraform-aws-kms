data "aws_caller_identity" "current" {
}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

#####################################
# Allow IAM access to keys
# See https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html
# for more information on key policies
#####################################
data "aws_iam_policy_document" "iam_key_policy" {
  statement {
    sid = "Enable IAM User Permissions"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${local.account_id}:root"]
    }

    actions   = ["kms:*"]
    resources = ["*"]
  }
}

resource "aws_kms_key" "terraform" {
  description             = "Used for encrypting secrets for Terraforming"
  deletion_window_in_days = 30
  enable_key_rotation     = true
  policy                  = data.aws_iam_policy_document.iam_key_policy.json

  tags = var.tags

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_kms_alias" "terraform" {
  name          = var.kms_terraform_alias
  target_key_id = aws_kms_key.terraform.key_id
}
