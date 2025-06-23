resource "docker_image" "my_img" {
  name = "my_local_nginx:latest"
  build {
    context    = path.module 
    dockerfile = "Dockerfile"
  }
}

## Start a container
resource "docker_container" "my_container" {
  name  = var.container_name
  image = docker_image.my_img.image_id
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}
