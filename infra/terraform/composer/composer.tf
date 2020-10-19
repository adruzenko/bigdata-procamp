resource "google_composer_environment" "procamp_env" {
  provider = google-beta

  name   = "procamp-env"
  region = var.region
  labels = {
    bigdata-procamp = true
  }

  config {
    node_count = 3

    node_config {
      zone         = "${var.zone}"
      machine_type = "n1-standard-1"
      disk_size_gb = 50
    }

    software_config {
      image_version  = "${var.composer_image_version}"
      python_version = 3
    }
  }
}

/*
def create_env(region, env_name):
    from subprocess import check_output
    check_output([
        'gcloud',
        'composer',
        'environments',
        'create',
        f'{env_name}',
        + f'--location={region}',
        +'--disk-size=20GB',
        +'--image-version=composer-1.12.0-airflow-1.10.10',
        +'--machine-type=n1-standard-2',
        f'--zone={region}-a',
        '--network=default',
        +'--node-count=3',
        '--python-version=3'
    ])
*/