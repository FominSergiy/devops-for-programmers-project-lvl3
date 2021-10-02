# terraform
init:
	terraform -chdir=terraform init

lint:
	terraform fmt -check -diff terraform

validate:
	terraform -chdir=terraform validate

plan:
	terraform -chdir=terraform plan

apply:
	terraform -chdir=terraform apply

destroy:
	terraform -chdir=terraform destroy

# vault-related
create-vault-pass:
	touch vault_password

# datadog.yml or vault.yml
FILE=vault.yml

# ansible-vault
encrypt:
	ansible-vault encrypt group_vars/webservers/${FILE} \
	--vault-password-file ansible/vault_password

view:
	ansible-vault view group_vars/webservers/${FILE} \
	--vault-password-file ansible/vault_password

decrypt:
	ansible-vault decrypt group_vars/webservers/${FILE} \
	--vault-password-file ansible/vault_password

#ansible
install:
	ansible-galaxy collection install -r ansible/requirements.yml

deploy:
	ansible-playbook -i ansible/inventory.ini  \
	-v ansible/playbook.yml \
	--vault-password-file ansible/vault_password