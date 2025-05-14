# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Source environment secrets from your HCP Terraform variable set
store "varset" "tokens" {
  id       = "varset-RYjcHNRHFgCA5gQH"
  category = "env"
}

deployment "dev" {
  inputs = {
    regions       = ["us-east-1"]
    access_key    = store.varset.tokens.AWS_ACCESS_KEY_ID
    secret_key    = store.varset.tokens.AWS_SECRET_ACCESS_KEY
    session_token = store.varset.tokens.AWS_SESSION_TOKEN
    default_tags  = { stacks-varset-tag = store.varset.tokens.default_tags }
  }
}

# deployment "staging" {
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
    regions       = ["us-east-1", "us-west-1"]
    access_key    = store.varset.tokens.AWS_ACCESS_KEY_ID
    secret_key    = store.varset.tokens.AWS_SECRET_ACCESS_KEY
    session_token = store.varset.tokens.AWS_SESSION_TOKEN
    default_tags  = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}
