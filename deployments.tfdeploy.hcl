# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Source environment secrets from your HCP Terraform variable set
# store "varset" "terra_tokens" {
#   id       = "varset-B4tF7wet7KYcNafR"
#   category = "terraform"
# }

store "varset" "blahblah" {
  id       = "varset-qkgWYedVNtAtQkCL"
  category = "terraform"
}

store "varset" "aws" {
  id       = "varset-XntEbAoZUwVKMLkA"
  category = "env"
}

# store "varset" "aws" {
#   name     = "AWS"
#   category = "env"
# }


deployment "dev" {
  inputs = {
    regions       = store.varset.blahblah.stable.dev
    access_key    = store.varset.aws.AWS_ACCESS_KEY_ID
    secret_key    = store.varset.aws.AWS_SECRET_ACCESS_KEY
    session_token = store.varset.aws.AWS_SESSION_TOKEN
    default_tags  = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

# deployment "stag" {
#   inputs = {
#     regions       = ["us-east-1", "us-west-1"]
#     access_key    = store.varset.tokens.AWS_ACCESS_KEY_ID
#     secret_key    = store.varset.tokens.AWS_SECRET_ACCESS_KEY
#     session_token = store.varset.tokens.AWS_SESSION_TOKEN
#     default_tags  = { stacks-preview-example = "lambda-component-expansion-stack" }
#   }
# }

deployment "prod" {
  inputs = {
    regions       = store.varset.blahblah.stable.prod
    access_key    = store.varset.aws.AWS_ACCESS_KEY_ID
    secret_key    = store.varset.aws.AWS_SECRET_ACCESS_KEY
    session_token = store.varset.aws.AWS_SESSION_TOKEN
    default_tags  = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}
