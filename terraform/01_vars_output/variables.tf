

variable "env" {
  description = "env: dev or prod"
}

variable "image_name" {
  #type = string
  #default     = "ubuntu/apache2"
  #default     = "nginx"
  description = "name of the image to be used"
  type        = map(any)
  default = {
    dev  = "ghost:latest"
    prod = "ghost:alpine"
  }
}

variable "int_port" {
  default = "80"
}

variable "ext_port" {
  type = map(any)
  default = {
    dev  = "8081"
    prod = "8080"
  }
}
variable "container_name" {
  type        = map(any)
  description = "containe depends on env: dev or prod"
  default = {
    dev  = "blog_dev"
    prod = "blog_prod"
  }
}
