locals {
  image = "gcr.io/${var.project_id}/${var.namespace}"

  steps = [
    {
      name = "gcr.io/cloud-builders/go"
      args = ["test"]
      env  = ["PROJECT_ROOT=${var.namespace}"]
    },
    {
      name = "gcr.io/cloud-builders/docker"
      args = ["build", "-t", local.image, "."]
    },
    {
      name = "gcr.io/cloud-builders/docker"
      args = ["push", local.image]
    },
    {
      name = "gcr.io/cloud-builders/gcloud"
      args = ["run", "deploy", "google_cloud_run_service.service.name", "--image", local.image, "--region", var.region, "--platform", "managed", "-q"]
    }
  ]
}