resource "google_compute_network" "vpc_network" {
  project                 = "omar-yasser-375922"
  name                    = "vpc-project"
  auto_create_subnetworks = false
  mtu                     = 1460
}