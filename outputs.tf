output "terraform_key_alias" {
  description = "Key alias for the KMS key used for Terraform operations"
  value       = aws_kms_alias.terraform.name
}

output "terraform_key_id" {
  description = "Key alias for the KMS key used for Terraform operations"
  value       = aws_kms_alias.terraform.target_key_id
}

output "all_keys_policy" {
  description = "Name of the All Keys policy"
  value       = var.create_all_keys_policy ? aws_iam_policy.all_keys_admin[0].name : null
}

output "all_keys_policy_arn" {
  description = "ARN of the All Keys policy"
  value       = var.create_all_keys_policy ? aws_iam_policy.all_keys_admin[0].arn : null
}
