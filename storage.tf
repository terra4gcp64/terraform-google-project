resource "google_storage_bucket" "state" {
  project  = google_project.object.project_id
  name     = local.g_sbk_name
  location = var.g_sbk_location

  storage_class               = "MULTI_REGIONAL"
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_member" "object" {
  for_each = toset(local.g_sbk_roles_owner)
  member   = "serviceAccount:${module.g_iam_sa_owner.g_isa_email}"
  bucket   = google_storage_bucket.state.name

  role = each.key
}
