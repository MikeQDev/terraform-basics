### Labs from Udemy Course: `Terraform for AWS - Beginner to Expert 2020 (0.12)`

Add this to .bashrc to avoid storing credentials in .tf files. Alternatively, use shared AWS credentials file or configuration file or HashiCorp Vault
```
export AWS_ACCESS_KEY_ID=accessKeyId
export AWS_SECRET_ACCESS_KEY=secretAccessKey
```

Common commands:
```
terraform init # Prepare/initialize working directory
terraform plan # Show changes by current config
terraform apply # Create/update infrastructure
terraform destroy # Destroy previously-created infrastructure
```

Modules are containers for multiple resources that are used together. Can be created and used to abstract infrastructure. There is also an official TF registry for pre-made modules
