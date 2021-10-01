terraform {
  backend "remote" {
    organization = "hexlet-learning"

    workspaces {
      name = "my-app-dev"
    }
  }
}