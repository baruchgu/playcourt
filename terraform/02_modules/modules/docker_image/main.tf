resource "docker_image" "my_img" {
  name = lookup(var.image_name, var.env)
}

