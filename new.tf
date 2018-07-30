resource "google_compute_instance" "default" {
        name    = "terraform"
        machine_type = "n1-standard-1"
	zone	= "us-central1-a"
	boot_disk {
		initialize_params {
			image = "centos-cloud/centos-7"
			}
		}
	network_interface{
		network = "default"
		
		access_config{
		//ephenerak UO
		}
	}

	metadata_startup_script = "sudo yum update && touch /ok"

}

