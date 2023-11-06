
resource "google_bigquery_data_transfer_config" "scheduled_query" {
	data_source_id = "scheduled_query"
	location = var.region
	schedule = "every day 15:00"
	display_name = "terraform-schedule"
	params = {
    "query" = templatefile("./query.sql",{project = var.project})
	}
    service_account_name = var.service_account
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.34.0"
    }
  }
}
provider "google" {
    project = var.project
    region = var.region
}
