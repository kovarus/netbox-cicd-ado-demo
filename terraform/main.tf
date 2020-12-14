terraform {
  backend "remote" {
    organization = "KPSC"

    workspaces {
      name = "demo-azure-ado-netbox"
    }
  }
}

variable "active_app" {}
variable "env_id" {}
variable "netbox_version" {}

module "netbox_app" {
  source  = "app.terraform.io/KPSC/netbox_cicd/azurerm"
  version = "0.0.1"

  owner_username = "towen"
  az_location    = "westus2"
  aws_region     = "us-west-2"
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChDUm7y/ykK9S5ZFO1Hmk2cge6g7iyQzILbJxR5d1PKF50QAkT09AMwra2Nzy9eEQNamiF1V0VxHkhOqpXg1XQVebcsppJLn7LKQRQDNp8TLYfWdLg5E8ESugS+pxmcX3JPF8QMNW0O34LtPYXQ/CrJcEsPUSadEvn0yLkAWOYU24jhs81fQPXmbBX6H7rRaj3Yx7bHcsyzRqTcVpbUfeD0UKz96v7l9FZ6j/2u0ONhQJ95L5GQzy5Wq9S9z2/AokWKNOB9jkqRNBg5OW8zYadP/n1uhBPeApWFzjLAP8qHceNOtGZuWqHbgXwh8V7FJJoNl21OWfxg/mwKm136JH1 towen@towen-mbp.local"
  tower_wf_id    = 65
  tower_params   = ["executed_from: Terraform Cloud demo-azure-ado-netbox"]
  active_app     = var.active_app
  env_id         = var.env_id
  netbox_version = netbox_version
}