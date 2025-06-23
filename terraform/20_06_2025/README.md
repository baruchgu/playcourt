# Open nginx service
Start nginx server by Terraform based on Dockerfile

## How to run
```sh
&> cd playcorut/terraform/20_06_2025
&> terraform init
%> terraform plan
%> terraform apply
```

## How to test
```sh
%> curl http://localhost:8080
```
## Expected output
```sh
Shalom aleihem
```

## Clean
```sh
%> terraform destroy 
```

## Notes:
- I whould have to restart the docker daemon each time before run `terraform apply`




