terraform {
  backend "gcs" {
    bucket = "terraform-build"
    prefix = "terraform-state"
  }
}
