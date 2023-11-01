variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_version" {
  description = "The MySQL, PostgreSQL or SQL Server version to use"
  type        = string
}

variable "db_region" {
  description = "The region the instance will sit in. If a region is not provided in the resource definition, the provider region will be used instead"
  type        = string
}

variable "db_username" {
  description = "The database username"
  type        = string
}

variable "db_password" {
  description = "The database password"
  type        = string
}

variable "db_tier" {
  description = "The machine type to use"
  type        = string
}

variable "db_storage" {
  description = "The size of data disk, in GB"
  type        = string
}

variable "db_storage_type" {
  description = "The type of data disk: PD_SSD or PD_HDD"
  type        = string
}

variable "db_ipv4_enabled" {
  description = "Whether this Cloud SQL instance should be assigned a public IPV4 address"
  type        = bool
  default     = false
}

variable "db_private_network" {
  description = " The VPC network from which the Cloud SQL instance is accessible for private IP"
  type        = string
  default     = null
}

variable "db_enable_private_path_for_google_cloud_services" {
  description = "Whether Google Cloud services such as BigQuery are allowed to access data in this Cloud SQL instance over a private IP connection"
  type        = bool
  default     = true
}
