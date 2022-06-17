# google_compute_instance.default:
resource "google_compute_instance" "default" {
    labels               = {
        "container-vm" = "cos-stable-97-16919-29-40"
    }
    machine_type         = "n1-standard-1"
    metadata             = {
        "enable-oslogin"            = "true"
        "gce-container-declaration" = <<-EOT
            spec:
              containers:
              - name: containerized-vm
                image: nginx
                stdin: false
                tty: false
              restartPolicy: Always
            # This container declaration format is not public API and may change without notice. Please
            # use gcloud command-line tool or Google Cloud Console to run Containers on Google Compute Engine.
        EOT
    }
    name                 = "containerized-vm"
    project              = "qwiklabs-gcp-01-8c530c5be17c"
    
    tags                 = [
        "http-server",
    ]

    zone                 = "us-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "containerized-vm"
        mode        = "READ_WRITE"
        initialize_params {
      image = "cos-cloud/cos-stable-97-16919-29-40"
    }
       
      
    }

 

    network_interface {
        network            = "default"
        access_config {
        }
    }

}
