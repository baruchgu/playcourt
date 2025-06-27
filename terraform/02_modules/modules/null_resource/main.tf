
resource "docker_image" "my_img" {
  name = lookup(var.image_name, var.env)
}

## Start a container
resource "docker_container" "my_container" {
  name  = lookup(var.container_name, var.env)
  image = docker_image.my_img.image_id
  env = [ "database__client=sqlite3",
      "database__connection__filename=content/data/ghost.db",
      "database__useNullAsDefault=true",
      "database__debug=false" ] 
  ports {
    internal = var.int_port
    external = lookup(var.ext_port, var.env)
  }
}

resource "null_resource" "my_null" {
  provisioner "local-exec" {
    command = "sleep 5; echo running on this system after 5 sec > Counter.txt"
  }
}

