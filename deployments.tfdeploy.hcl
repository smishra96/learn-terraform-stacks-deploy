# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

store "varset" "aws" {
  name     = "AWS2"
  category = "env"
}

store "varset" "regions" {
  name     = "REGIONS"
  category = "terraform"
}

deployment "dev" {
  inputs = {
    regions       = ["us-east-1"]
    regions       = store.varset.regions.dev
    access_key    = store.varset.aws.AWS_ACCESS_KEY_ID
    secret_key    = store.varset.aws.AWS_SECRET_ACCESS_KEY
    session_token = store.varset.aws.AWS_SESSION_TOKEN
    default_tags  = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "prod" {
  inputs = {
    regions       = ["us-east-1", "us-west-2"]
    regions       = store.varset.regions.prod
    access_key    = store.varset.aws.AWS_ACCESS_KEY_ID
    secret_key    = store.varset.aws.AWS_SECRET_ACCESS_KEY
    session_token = store.varset.aws.AWS_SESSION_TOKEN
    default_tags  = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}
