resource "google_compute_instance" "proj-vm" {
  name         = "proj-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-c"
  service_account {
    email = google_service_account.service_account.email
    scopes = [ "cloud-platform" ]
  }
  depends_on = [
    google_container_cluster.pv-cluster
   , google_container_node_pool.node-pool
  ]

  metadata_startup_script = "${file("./script.sh")}"
  boot_disk {
    initialize_params {
     image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.management-subnet.id

    
  } 
}
