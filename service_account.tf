module "g_iam_sa_owner" {
  source = "../../src/terraform-google-iam-sa"

  g_isa_project = google_project.object.project_id

  g_isa_alias        = local.g_isa_alias
  g_isa_alias_prefix = local.g_isa_alias_prefix
  g_isa_display_name = local.g_isa_display_name
}

resource "google_service_account_iam_member" "object" {
  for_each           = toset(local.g_isa_roles_owner)
  service_account_id = module.g_iam_sa_owner.g_isa_id
  member             = var.g_isa_member

  role = each.key
}
