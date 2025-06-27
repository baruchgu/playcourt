variable "env" {
  description = "env: dev or prod"
}

variable "image_name" {
  description = "name of the image to be used"
  type        = map(any)
  default = {
    dev  = "ghost:latest"
    prod = "ghost:alpine"
  }
}

