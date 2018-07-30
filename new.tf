resource "random_string" "uniquename" {
	length	 = 8
	special	 = false
	upper	 = false 
	}



resource "google_compute_instance" "default" {
        name    = "terraform-${random_string.uniquename.result}" 
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
		//ephemeral IP
		}
	}

	metadata_startup_script = "sudo yum update -y && yum install docker -y"

}

