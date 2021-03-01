# Terraform KMS

This is a small utility module that provisions a KMS Key for Terraform use and creates
a policy to allow IAM administration of all keys on the AWS account.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| all\_keys\_admin\_policy | Name of policy to allow administration of all keys | `string` | `"AllKeysAdministration"` | no |
| create\_all\_keys\_policy | Create the all keys policy | `bool` | `true` | no |
| key\_policy\_statements | Additional statements for the key policies. | `list(string)` | `[]` | no |
| kms\_terraform\_alias | Alias for the Terraform key | `string` | `"alias/terraform"` | no |
| tags | Tags for resoruces | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| all\_keys\_policy | Name of the All Keys policy |
| all\_keys\_policy\_arn | ARN of the All Keys policy |
| terraform\_key\_alias | Key alias for the KMS key used for Terraform operations |
| terraform\_key\_arm | ARN of the key created |
| terraform\_key\_id | Key alias for the KMS key used for Terraform operations |
