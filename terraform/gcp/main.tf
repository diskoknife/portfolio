provider "vault" {
  address = "http://127.0.0.1:8200"
}

provider "google" {
  project     = var.project
  region      = var.region
  credentials = data.vault_generic_secret.gcp_token.data["mytoken"]
}
