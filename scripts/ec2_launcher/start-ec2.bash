#!/bin/bash

aws ec2 run-instances \
  --image-id ami-026b57f3c383c2eec \
  --instance-type t2.micro \
  --subnet-id "$AWS_PUBLIC_SUBNET_EXAMPLE" \
  --security-group-ids "$AWS_SECURITY_GROUP_EXAMPLE" \
  --associate-public-ip-address \
  --key-name "$AWS_KEYPAIR_EXAMPLE" \
  --tag-specifications \
  "ResourceType=instance,Tags=[{Key=Name,Value='Render Test 4ish'}]" \
  --user-data file://install-script.bash
