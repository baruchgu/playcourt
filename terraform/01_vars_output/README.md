# Open nginx service
Start server by Terraform with variables and output 

## How to run
```sh
%> cd playcourt/terraform/01_vars_output
%> terraform init
%> terraform plan -var env=dev -out=ftplan.dev
%> terraform apply -auto-approve
```

## How to test
```sh
%> docker logs blog_dev
```
## Expected output
[`date and time`] ERROR connect ECONNREFUSED 127.0.0.1:3306


## Clean
```sh
%> terraform destroy -var env=dev
```

## Notes:
- I whould have to restart the docker daemon each time before run `terraform apply`
`sudo systemctl restart docker`




