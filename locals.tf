locals {

  #
  # Project
  #
  g_prj_alias = format(
    "%s%s",
    var.g_prj_name_prefix != "" ? "${var.g_prj_name_prefix}-" : "",
    var.g_prj_name
  )
  g_prj_name = format(
    "%s-%s",
    local.tg64.project,
    local.g_prj_alias
  )

  g_prj_service = [
    "storage.googleapis.com",
    "iam.googleapis.com",
    "cloudkms.googleapis.com"
  ]
  g_prj_roles_owner = [
    "roles/serviceusage.serviceUsageAdmin",
    "roles/owner"
  ]

  #
  # IAM / Service Account
  #
  g_isa_alias        = "owner"
  g_isa_alias_prefix = local.g_prj_alias
  g_isa_display_name = "Owner of the project ${local.g_prj_name}"
  g_isa_roles_owner = [
    "roles/iam.serviceAccountUser",
    "roles/iam.serviceAccountTokenCreator"
  ]

  #
  # Storage / Bucket Account
  #

  g_sbk_name = format(
    "%s-%s-%s",
    local.tg64.storage.bucket,
    local.g_prj_alias,
    "tfstate"
  )

  g_sbk_roles_owner = [
    "roles/storage.admin"
  ]

}
