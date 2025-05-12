# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "access_key" {
  description = "AWS access key"
  type        = string
  ephemeral   = true
}

variable "secret_key" {
  description = "AWS sensitive secret key."
  type        = string
  sensitive   = true
  ephemeral   = true
}

variable "session_token" {
  description = "AWS session token."
  type        = string
  sensitive   = true
  ephemeral   = true
}

required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.7.0"
  }

  random = {
    source  = "hashicorp/random"
    version = "~> 3.5.1"
  }

  archive = {
    source  = "hashicorp/archive"
    version = "~> 2.4.0"
  }

  local = {
    source  = "hashicorp/local"
    version = "~> 2.4.0"
  }
}

provider "aws" "configurations" {
  for_each = var.regions

  config {
    region = each.value

    access_key = var.access_key
    secret_key = var.secret_key
    token      = var.session_token

    default_tags {
      tags = var.default_tags
    }
  }
}

provider "random" "this" {}
provider "archive" "this" {}
provider "local" "this" {}
