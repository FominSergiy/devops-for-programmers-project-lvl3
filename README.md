### Hexlet tests and linter status:
[![Actions Status](https://github.com/FominSergiy/devops-for-programmers-project-lvl3/workflows/hexlet-check/badge.svg)](https://github.com/FominSergiy/devops-for-programmers-project-lvl3/actions)

# Requirements

- [Docker](https://www.docker.com/get-started) v20.10.7
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) v2.11.3
- [Python](https://www.python.org/downloads/) v3.9.6
- [Terraform](https://www.terraform.io/downloads.html) v1.0.3

I am using DigitalOcean to host my servers. For your vm **make sure you use image with Docker installed, or install it yourself**.
- [digitalOcean](https://www.digitalocean.com/)
- [vm-image](https://marketplace.digitalocean.com/apps/docker)

# Prepare Your Project


- save `secret.auto.tfvars` in `./terraform/` folder, which will contain your `DO_PAT` which will be used to authenticate to DO
- [get-do-api-key](https://hostlaunch.io/docs/how-to-get-a-digitalocean-api-key/)
- to use remote backend
    - create free account with Terraform `https://app.terraform.io/app`
    - once account is created, follow the instructions on **getting started** page
    - create an organization and select the `run terraform commands from local cli` option
    - create a workspcae and follow instructions
    - change **organization** and **workspaces** inside the `backend.tf` file to what you have set them up in your account
- run to install required roles/collections for ansible

```bash
$ make install
```

# Repo Structure

```
--/
  |__terraform/   ---> dir contains IaC deployed for this app
  |__ansible/     ---> dir contains deployment configs for an app to VMs defined in **inventory.ini**

```

# How to use

> We need to bring up our infra before we can make any configs with ansible

1. run terraform commands to bring up your infrastructure (please follow requirements first to set up your remote backend)

```bash
$ make init
$ make plan
$ make apply
```
2. once infra is setup, take note of ip addresses in the terraform `output` block. copy them over to `inventory.ini`
3. run `make deploy` command to set-up your vms with *react_tic_toe* app.

```bash
$ make deploy
```

# deployed app

`hexlet-sergiy.club`