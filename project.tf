resource "random_integer" "object" {
  min = 1000
  max = 9999
}

resource "google_project" "object" {
  name            = local.g_prj_alias
  project_id      = "${local.g_prj_alias}-${random_integer.object.id}"
  billing_account = var.g_prj_billing_account
  folder_id       = var.g_prj_folder_id
  labels          = var.g_prj_labels

  skip_delete         = false
  auto_create_network = false
}

resource "google_project_service" "object" {
  for_each = toset(concat(var.g_prj_service, local.g_prj_service))
  project  = google_project.object.id
  service  = each.key

  disable_dependent_services = true
  disable_on_destroy         = true
}

resource "google_project_iam_member" "object" {
  for_each = toset(local.g_prj_roles_owner)
  member   = "serviceAccount:${module.g_iam_sa_owner.g_isa_email}"
  project  = google_project.object.project_id

  role = each.key
}
