#
# Project
#
variable "g_prj_name" {
  type        = string
  nullable    = false
  description = "Project / Name"
}

variable "g_prj_billing_account" {
  type        = string
  nullable    = false
  description = "Project / Billing Account: to be associated to the new project"
}

variable "g_prj_name_prefix" {
  type        = string
  nullable    = true
  description = "Project / Name Prefix: text to be added before the Name"
  default     = ""
}

variable "g_prj_folder_id" {
  type        = string
  nullable    = true
  default     = null
  description = "Project / Folder ID: where the project will be created"
}

variable "g_prj_service" {
  type        = list(string)
  nullable    = true
  default     = []
  description = "Project / Services: additional Google API services"
}

variable "g_prj_labels" {
  type        = map(string)
  nullable    = true
  default     = {}
  description = "Project / Labels"
}

#
# IAM / Service Account
#
variable "g_isa_member" {
  type        = string
  nullable    = false
  description = "IAM / Service Account / Members: identities that will be granted access to the project owner service account"
}

#
# Storage / Bucket
#
variable "g_sbk_location" {
  type        = string
  nullable    = true
  default     = "US"
  description = "Storage / Bucket / Location"
}
