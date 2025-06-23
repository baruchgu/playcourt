
resource "docker_image" "my_img" {
  name = lookup(var.image_name, var.env)
}

## Start a container
resource "docker_container" "my_container" {
  name  = lookup(var.container_name, var.env)
  image = docker_image.my_img.image_id
  ports {
    internal = var.int_port
    external = lookup(var.ext_port, var.env)
  }
}

