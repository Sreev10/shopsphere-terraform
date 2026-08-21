output "instance_name" {
  description = "The name of the cloud sql database instance"
  value       = google_sql_database_instance.mysql.name
}
output "instance_connection_name" {
  description = "The connection name of the cloud sql database instance"
  value       = google_sql_database_instance.mysql.connection_name
}
output "private_ip_address" {
  description = "The private IP of the cloud sql database instance"
  value       = google_sql_database_instance.mysql.private_ip_address
}
output "public_ip_address" {
  description = "The public IP of the cloud sql database instance"
  value       = google_sql_database_instance.mysql.public_ip_address
}
output "database_name" {
  description = "The name of the cloud sql database"
  value       = google_sql_database.mysql.name
}
output "database_version" {
  description = "The version of the cloud sql database"
  value       = google_sql_database_instance.mysql.database_version
}
output "self_link" {
  description = "The self link of the cloud sql database instance"
  value       = google_sql_database_instance.mysql.self_link
}