# terraform
init:
	terraform -chdir=terraform init

lint:
	terraform fmt -check -diff terraform

validate:
	terraform -chdir=terraform validate

plan:
	terraform -chdir=terraform plan -var-file=secret.tfvars

apply:
	terraform -chdir=terraform apply -var-file=secret.tfvars

destroy:
	terraform -chdir=terraform destroy -var-file=secret.tfvars