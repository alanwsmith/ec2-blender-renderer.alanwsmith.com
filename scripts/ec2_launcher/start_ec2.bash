#!/bin/bash

# echo "Value check: "
# echo "--subnet-id $AWS_PUBLIC_SUBNET_EXAMPLE"
# echo "--security-group-ids $AWS_SECURITY_GROUP_EXAMPLE"
# echo "--key-name $AWS_KEYPAIR_EXAMPLE"
# echo "--iam-instance-profile Arn=$AWS_INSTANCE_PROFILE_EXAMPLE"

cat 00-initial-boot.bash > _combined-install-script.bash

ENCODED_DIRECTOR=`base64 reboot-setup-director.bash`
echo "echo '$ENCODED_DIRECTOR' | base64 -d > /home/ubuntu/reboot-setup-director.bash" >> _combined-install-script.bash 

ENCODED_01=`base64 01-first-reboot.bash`
echo "echo '$ENCODED_01' | base64 -d > /home/ubuntu/reboot-setup/01-first-reboot.bash" >> _combined-install-script.bash 


#cat 01-first-reboot.bash > _combined-install-script.bash)" >> _combined-install-script.bash

# base64 -d IyEvYmluL2Jhc2gKCnRvdWNoICJmcm9tLXJlYm9vdDEtZGlyZWN0LnR4dCIKdG91Y2ggIi9ob21lL3VidW50dS9mcm9tLXJlYm9vdDItZnVsbC1wYXRoLnR4dCIKCg== > reboot1.bash


aws ec2 run-instances \
  --user-data file://_combined-install-script.bash \
  --image-id ami-08c40ec9ead489470 \
  --instance-type t2.micro \
  --subnet-id "$AWS_PUBLIC_SUBNET_EXAMPLE" \
  --security-group-ids "$AWS_SECURITY_GROUP_EXAMPLE" \
  --associate-public-ip-address \
  --key-name "$AWS_KEYPAIR_EXAMPLE" \
  --iam-instance-profile Arn=$AWS_INSTANCE_PROFILE_EXAMPLE \
  --tag-specifications \
  "ResourceType=instance,Tags=[{Key=Name,Value='Render Test 4ish'}]" \
  --block-device-mapping "[ { \"DeviceName\": \"/dev/sda1\", \"Ebs\": { \"VolumeSize\": 200 } } ]"
