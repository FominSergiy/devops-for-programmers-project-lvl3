# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "hexlet" {
  name = "macOs-key"
}

# a list of vms
resource "digitalocean_droplet" "vms" {
  count    = length(var.vm_counts)
  image    = "docker-20-04"
  name     = "third-project-0${count.index}"
  region   = "ams3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.hexlet.id]
}

resource "digitalocean_domain" "domain" {
  name = "03bite-me.xyz"
}

resource "digitalocean_record" "static" {
  domain = digitalocean_domain.domain.name
  type   = "A"
  name   = "@"
  value  = digitalocean_loadbalancer.lb.ip
}

resource "digitalocean_certificate" "cert" {
  name    = "project-three-cert"
  type    = "lets_encrypt"
  domains = [digitalocean_domain.domain.name]
}

resource "digitalocean_loadbalancer" "lb" {
  name   = "lb-prj-three"
  region = "ams3"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 3000
    target_protocol = "http"
  }

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 3000
    target_protocol = "http"

    certificate_name = digitalocean_certificate.cert.name
  }

  healthcheck {
    port     = 3000
    protocol = "http"
    path     = "/"
  }

  droplet_ids = digitalocean_droplet.vms[*].id
}

# adding in a db cluster
resource "digitalocean_database_cluster" "postgres-db-cluster" {
  name       = "postgres-cluster"
  engine     = "pg"
  version    = "11"
  size       = "db-s-1vcpu-1gb"
  region     = "nyc1"
  node_count = 1
}

resource "digitalocean_database_db" "db" {
  cluster_id = digitalocean_database_cluster.postgres-db-cluster.id
  name       = "db"
}