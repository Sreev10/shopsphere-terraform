output "db_password_secret_id" {
  description = "Secret Manager ID for database password"

  value = google_secret_manager_secret.db_password.secret_id

}

output "db_username_secret_id" {

  description = "Secret Manager ID for database username"

  value = google_secret_manager_secret.db_username.secret_id

}

output "jwt_secret_id" {

  description = "Secret Manager ID for JWT secret"

  value = google_secret_manager_secret.jwt_secret.secret_id

}
  