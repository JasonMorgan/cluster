#!/bin/sh

export AWS_REGION=us-east-1 # This is used to help encode your environment variables
export AWS_ACCESS_KEY_ID=AMANACCESSKEY
export AWS_SECRET_ACCESS_KEY=IMSUPERSECRET
# export AWS_SESSION_TOKEN=<session-token> # If you are using Multi-Factor Auth.

# The clusterawsadm utility takes the credentials that you set as environment
# variables and uses them to create a CloudFormation stack in your AWS account
# with the correct IAM resources.
clusterawsadm bootstrap iam create-cloudformation-stack

# Create the base64 encoded credentials using clusterawsadm.
# This command uses your environment variables and encodes
# them in a value to be stored in a Kubernetes Secret.
export AWS_B64ENCODED_CREDENTIALS=$(clusterawsadm bootstrap credentials encode-as-profile)

# Finally, initialize the management cluster
clusterctl init --infrastructure aws

export AWS_REGION=us-east-1
export AWS_SSH_KEY_NAME=IMAKEYNAME
# Select instance types
export AWS_CONTROL_PLANE_MACHINE_TYPE=t3.small
export AWS_NODE_MACHINE_TYPE=t3.small