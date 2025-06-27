module "my_app" {
  source         = "./modules/docker_container"
  image_name     = "nginx:latest"
  container_name = "my-nginx"
  ports = [{
    internal = 80
    external = 8080
  }]
}


