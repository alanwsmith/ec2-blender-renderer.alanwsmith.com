#!/bin/bash

# echo "Value check: "
# echo "--subnet-id $AWS_PUBLIC_SUBNET_EXAMPLE"
# echo "--security-group-ids $AWS_SECURITY_GROUP_EXAMPLE"
# echo "--key-name $AWS_KEYPAIR_EXAMPLE"
# echo "--iam-instance-profile Arn=$AWS_INSTANCE_PROFILE_EXAMPLE"

echo "Building user-data script"

cat 00-initial-boot.bash > _combined-install-script.bash
ENCODED_DIRECTOR=`base64 reboot-setup-director.bash`
echo "echo '$ENCODED_DIRECTOR' | base64 -d > /home/ubuntu/reboot-setup-director.bash" >> _combined-install-script.bash 

ENCODED_01=`base64 reboot-01.bash`
echo "echo '$ENCODED_01' | base64 -d > /home/ubuntu/reboot-setup/reboot-01.bash" >> _combined-install-script.bash 

ENCODED_02=`base64 reboot-02.bash`
echo "echo '$ENCODED_02' | base64 -d > /home/ubuntu/reboot-setup/reboot-02.bash" >> _combined-install-script.bash 

ENCODED_03=`base64 reboot-03.bash`
echo "echo '$ENCODED_03' | base64 -d > /home/ubuntu/reboot-setup/reboot-03.bash" >> _combined-install-script.bash 

ENCODED_04=`base64 reboot-04.bash`
echo "echo '$ENCODED_04' | base64 -d > /home/ubuntu/reboot-setup/reboot-04.bash" >> _combined-install-script.bash 

ENCODED_05=`base64 reboot-05.bash`
echo "echo '$ENCODED_05' | base64 -d > /home/ubuntu/reboot-setup/reboot-05.bash" >> _combined-install-script.bash 


echo 'reboot' >> _combined-install-script.bash 

echo "Launched EC2 Instance"

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
