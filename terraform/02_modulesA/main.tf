module "do_image" {
   source = "./modules/image"
   #image_name = "ubuntu/apache2:latest"
   image_name = var.image_name
}
