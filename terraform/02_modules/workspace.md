terraform workspace new dev
terraform workspace show
terraform workspace select dev
terraform plan -out=tfplan_dev -var env=dev
terraform apply tfplan_dev
terraform workspace new prod
terraform plan -out=tfplan_dev -var env=prod
terraform apply tfplan_prod
ls -la # seek for folder terraform.tfstate.d
ls -la terraform.tfstate.d
curl localhost:8081
curl localhost:8080 # both of the port should be accessable

