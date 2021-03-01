variable "kms_terraform_alias" {
  description = "Alias for the Terraform key"
  default     = "alias/terraform"
}

variable "all_keys_admin_policy" {
  description = "Name of policy to allow administration of all keys"
  default     = "AllKeysAdministration"
}

variable "tags" {
  description = "Tags for resoruces"
  default     = {}
}

variable "create_all_keys_policy" {
  description = "Create the all keys policy"
  default     = true
}

variable "key_policy_statements" {
  description = "Additional statements for the key policies."
  type        = list(string)
  default     = []
}
