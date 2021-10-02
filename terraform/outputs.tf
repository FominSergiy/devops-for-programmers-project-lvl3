// pass a collection of vms
output "droplets_ips" {
  value = digitalocean_droplet.vms[*].ipv4_address
}