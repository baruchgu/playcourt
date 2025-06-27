variable "image_name" {
  description = "Docker image to use"
  type        = string
}
variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "ports" {
  description = "dynamic ports from root folder"
  type = list(object({
    internal = number
    external = number
  }))
}

variable "int_port" {
  default = "2368"
}

variable "ext_port" {
  type = map(any)
  default = {
    dev  = "8081"
    prod = "8080"
  }
}

