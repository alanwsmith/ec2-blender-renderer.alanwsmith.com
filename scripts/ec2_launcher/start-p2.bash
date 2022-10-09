#!/bin/bash

# echo "Value check: "
# echo "--subnet-id $AWS_PUBLIC_SUBNET_EXAMPLE"
# echo "--security-group-ids $AWS_SECURITY_GROUP_EXAMPLE"
# echo "--key-name $AWS_KEYPAIR_EXAMPLE"
# echo "--iam-instance-profile Arn=$AWS_INSTANCE_PROFILE_EXAMPLE"

echo "Building user-data script"

cat initial-boot.bash > _combined-install-script.bash

ENCODED_DIRECTOR=`base64 director.bash`
echo "echo '$ENCODED_DIRECTOR' | base64 -d > /home/ubuntu/setup/director.bash" >> _combined-install-script.bash 

ENCODED_01=`base64 p2-setup/01.bash`
echo "echo '$ENCODED_01' | base64 -d > /home/ubuntu/setup/steps/01.bash" >> _combined-install-script.bash 

ENCODED_02=`base64 p2-setup/02.bash`
echo "echo '$ENCODED_02' | base64 -d > /home/ubuntu/setup/steps/02.bash" >> _combined-install-script.bash 

ENCODED_03=`base64 p2-setup/03.bash`
echo "echo '$ENCODED_03' | base64 -d > /home/ubuntu/setup/steps/03.bash" >> _combined-install-script.bash 

ENCODED_04=`base64 p2-setup/04.bash`
echo "echo '$ENCODED_04' | base64 -d > /home/ubuntu/setup/steps/04.bash" >> _combined-install-script.bash 

ENCODED_05=`base64 p2-setup/05.bash`
echo "echo '$ENCODED_05' | base64 -d > /home/ubuntu/setup/steps/05.bash" >> _combined-install-script.bash 

ENCODED_06=`base64 p2-setup/06.bash`
echo "echo '$ENCODED_06' | base64 -d > /home/ubuntu/setup/steps/06.bash" >> _combined-install-script.bash 

echo 'reboot' >> _combined-install-script.bash 


INSTANCE_TYPE="p3.16xlarge"
echo "Launching $INSTANCE_TYPE"

aws ec2 run-instances \
  --user-data file://_combined-install-script.bash \
  --image-id ami-0149b2da6ceec4bb0 \
  --instance-type $INSTANCE_TYPE \
  --subnet-id "$AWS_PUBLIC_SUBNET_EXAMPLE" \
  --security-group-ids "$AWS_SECURITY_GROUP_EXAMPLE" \
  --associate-public-ip-address \
  --key-name "$AWS_KEYPAIR_EXAMPLE" \
  --iam-instance-profile Arn=$AWS_INSTANCE_PROFILE_EXAMPLE \
  --tag-specifications \
  "ResourceType=instance,Tags=[{Key=Name,Value='$INSTANCE_TYPE - Render Test'}]" \
  --block-device-mapping "[ { \"DeviceName\": \"/dev/sda1\", \"Ebs\": { \"VolumeSize\": 200 } } ]" 
