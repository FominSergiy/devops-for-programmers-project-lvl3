### Hexlet tests and linter status:
[![Actions Status](https://github.com/FominSergiy/devops-for-programmers-project-lvl3/workflows/hexlet-check/badge.svg)](https://github.com/FominSergiy/devops-for-programmers-project-lvl3/actions)

# Requirements
- save `secret.auto.tfvars` in `./terraform/` folder, which will contain your `DO_PAT` which will be used to authenticate to DO
- to use remote backend
    - create free account with Terraform `https://app.terraform.io/app`
    - once account is created, follow the instructions on **getting started** page
    - create an organization and select the `run terraform commands from local cli`
    - create a workspcae and follow instructions
    - change **organization** and **workspaces** inside the `backend.tf` file to what you have set them up in your account

