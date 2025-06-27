output "app_container_id" {
  value = module.my_app.container_id
  #value = module.my_app.docker_container.container_id
}
