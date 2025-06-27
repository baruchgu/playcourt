resource "docker_image" "my_image" {
  name = var.image_name
}

resource "docker_container" "my_container" {
  name  = var.container_name
  image = docker_image.my_image.image_id
  dynamic "ports" {
    for_each = var.ports
    content {
      internal = ports.value.internal
      external = ports.value.external
    }
  }
}

