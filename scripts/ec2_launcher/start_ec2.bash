#!/bin/bash

# echo "Value check: "
# echo "--subnet-id $AWS_PUBLIC_SUBNET_EXAMPLE"
# echo "--security-group-ids $AWS_SECURITY_GROUP_EXAMPLE"
# echo "--key-name $AWS_KEYPAIR_EXAMPLE"
# echo "--iam-instance-profile Arn=$AWS_INSTANCE_PROFILE_EXAMPLE"

echo "Building user-data script"

cat initial-boot.bash > _combined-install-script.bash

ENCODED_DIRECTOR=`base64 setup-director.bash`
echo "echo '$ENCODED_DIRECTOR' | base64 -d > /home/ubuntu/setup-director.bash" >> _combined-install-script.bash 

ENCODED_01=`base64 01-reboot.bash`
echo "echo '$ENCODED_01' | base64 -d > /home/ubuntu/reboot-setup/01-reboot.bash" >> _combined-install-script.bash 

ENCODED_02=`base64 02-reboot.bash`
echo "echo '$ENCODED_02' | base64 -d > /home/ubuntu/reboot-setup/02-reboot.bash" >> _combined-install-script.bash 

ENCODED_03=`base64 03-reboot.bash`
echo "echo '$ENCODED_03' | base64 -d > /home/ubuntu/reboot-setup/03-reboot.bash" >> _combined-install-script.bash 

ENCODED_04=`base64 04-reboot.bash`
echo "echo '$ENCODED_04' | base64 -d > /home/ubuntu/reboot-setup/04-reboot.bash" >> _combined-install-script.bash 

ENCODED_05=`base64 reboot-05.bash`
echo "echo '$ENCODED_05' | base64 -d > /home/ubuntu/reboot-setup/05-reboot.bash" >> _combined-install-script.bash 


echo 'reboot' >> _combined-install-script.bash 

echo "Launched EC2 Instance"

aws ec2 run-instances \
  --user-data file://_combined-install-script.bash \
  --image-id ami-0149b2da6ceec4bb0 \
  --instance-type g5.xlarge \
  --subnet-id "$AWS_PUBLIC_SUBNET_EXAMPLE" \
  --security-group-ids "$AWS_SECURITY_GROUP_EXAMPLE" \
  --associate-public-ip-address \
  --key-name "$AWS_KEYPAIR_EXAMPLE" \
  --iam-instance-profile Arn=$AWS_INSTANCE_PROFILE_EXAMPLE \
  --tag-specifications \
  "ResourceType=instance,Tags=[{Key=Name,Value='Render Test 4ish'}]" \
  --block-device-mapping "[ { \"DeviceName\": \"/dev/sda1\", \"Ebs\": { \"VolumeSize\": 200 } } ]"
