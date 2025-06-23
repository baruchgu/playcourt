variable "image_name" {
  type        = string
  default     = "nginx"
  description = "name of the image to be used"
}

variable "int_port" {
  default = 80
}

variable "ext_port" {
  default = 8080
}

variable "container_name" {
  description = "container name"
  default     = "nginx"
}
