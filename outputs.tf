#
# Project
#
output "g_prj_id" {
  value = google_project.object.id
}

output "g_prj_project_id" {
  value = google_project.object.project_id
}

output "g_prj_service" {
  value = google_project_service.object
}

#
# Service Account
#
output "g_isa_email_owner" {
  value = module.g_iam_sa_owner.g_isa_email
}

output "g_isa_display_name_owner" {
  value = module.g_iam_sa_owner.g_isa_display_name
}

output "g_isa_member" {
  value = google_service_account_iam_member.object
}

#
# Storage / Bucket
#
output "g_sbk_name" {
  value = google_storage_bucket.state.name
}
