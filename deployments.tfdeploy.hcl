# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

// Varset for AWS credentials
store "varset" "aws" {
  name     = "AWS"
  category = "env"
}

store "varset" "aws_tf" {
  name     = "AWS"
  category = "terraform"
}

// Varset for regions
store "varset" "regions" {
  name     = "REGIONS"
  category = "terraform"
}

// Note: The values for variable's marked as stable/non-ephemeral stays consistent between plan & apply phases. 
//       To do this, we snapshot or save the variable value before the plan phase and use the saved value in 
//       both plan & apply phase.

# Restrictions:
# - a variable cannot be used as both stable and non-stable in the same deployment for different inputs.
# - a key with the name "stable" cannot be created in the HCP varset, as it is causes ambiguous situations.

deployment "dev" {
  inputs = {
    # regions = ["us-east-1"]
    regions       = store.varset.regions.stable.stable_map.stable.dev
    access_key    = store.varset.aws_tf.AWS_ACCESS_KEY_ID.stable
    secret_key    = store.varset.aws.AWS_SECRET_ACCESS_KEY
    session_token = store.varset.aws.AWS_SESSION_TOKEN
    default_tags  = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "prod" {
  inputs = {
    # regions = ["us-east-1", "us-west-1"]
    regions       = store.varset.regions.stable.stable_map.stable.prod
    access_key    = store.varset.aws_tf.AWS_ACCESS_KEY_ID.stable
    secret_key    = store.varset.aws.AWS_SECRET_ACCESS_KEY
    session_token = store.varset.aws.AWS_SESSION_TOKEN
    default_tags  = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}
