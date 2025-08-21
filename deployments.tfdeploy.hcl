# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

// Varset for AWS credentials
store "varset" "aws" {
  name     = "AWS2"
  category = "env"
}

// Varset for regions
# store "varset" "regions" {
#   name     = "REGIONS"
#   category = "terraform"
# }

// Note: a variable cannot be used as both stable and non-stable in the same deployment for different inputs.
// Note: The variables marked as stable/non-ephemeral consistent between plan & apply phases. 
//       To do this, we snapshot or save the variable value before the plan phase and use the saved value in 
//       both plan & apply phase.

deployment "dev" {
  inputs = {
    regions = ["us-east-1"]
    # regions       = store.varset.regions.stable.dev
    access_key    = store.varset.aws.AWS_ACCESS_KEY_ID
    secret_key    = store.varset.aws.AWS_SECRET_ACCESS_KEY
    session_token = store.varset.aws.AWS_SESSION_TOKEN
    default_tags  = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "prod" {
  inputs = {
    regions = ["us-east-1", "us-west-1"]
    # regions       = store.varset.regions.stable.prod
    access_key    = store.varset.aws.AWS_ACCESS_KEY_ID
    secret_key    = store.varset.aws.AWS_SECRET_ACCESS_KEY
    session_token = store.varset.aws.AWS_SESSION_TOKEN
    default_tags  = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}
