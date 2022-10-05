#!/bin/bash

echo "Value check: "
echo "--subnet-id $AWS_PUBLIC_SUBNET_EXAMPLE"
echo "--security-group-ids $AWS_SECURITY_GROUP_EXAMPLE"
echo "--key-name $AWS_KEYPAIR_EXAMPLE"
echo "--iam-instance-profile Arn=$AWS_INSTANCE_PROFILE_EXAMPLE"

aws ec2 run-instances \
  --image-id ami-08c40ec9ead489470 \
  --instance-type g5.xlarge \
  --subnet-id "$AWS_PUBLIC_SUBNET_EXAMPLE" \
  --security-group-ids "$AWS_SECURITY_GROUP_EXAMPLE" \
  --associate-public-ip-address \
  --key-name "$AWS_KEYPAIR_EXAMPLE" \
  --iam-instance-profile Arn=$AWS_INSTANCE_PROFILE_EXAMPLE \
  --tag-specifications \
  "ResourceType=instance,Tags=[{Key=Name,Value='Render Test 4ish'}]" \
  --user-data file://install-script.bash
