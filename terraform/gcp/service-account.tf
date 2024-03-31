resource "google_service_account" "default" {
  account_id   = "vm-instance-sa-1"
  display_name = "Custom SA for VM Instance"
}
