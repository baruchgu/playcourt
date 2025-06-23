output "INT_IPaddress" {
  value = docker_container.my_container.network_data[0].ip_address
}

output "EXT_IPaddress" {
  value = docker_container.my_container.ports[0].ip
}
