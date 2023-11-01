output "db_instance_host" {
  description = "The database host"
  value       = google_sql_database_instance.main.self_link
}

output "db_connection_name" {
  description = "The connection name of the instance to be used in connection strings"
  value       = google_sql_database_instance.main.connection_name
}

output "db_public_ip_address" {
  description = "The first public IPv4 address assigned"
  value       = google_sql_database_instance.main.public_ip_address
}

output "db_private_ip_address" {
  description = "The first private IPv4 address assigned"
  value       = google_sql_database_instance.main.private_ip_address
}

output "db_instance_region" {
  description = "The database instance region"
  value       = var.db_region
}
