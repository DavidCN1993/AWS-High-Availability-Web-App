#!/bin/bash
# This script sets up an Auto Scaling Group with a Launch Template.

# Variables
LAUNCH_TEMPLATE_NAME="WebApp-LaunchTemplate"
AUTO_SCALING_GROUP_NAME="WebApp-ASG"
MIN_INSTANCES=2
MAX_INSTANCES=5
DESIRED_INSTANCES=2
VPC_SUBNETS="subnet-xyz,subnet-abc"  # Replace with your subnet IDs

# Create a Launch Template
aws ec2 create-launch-template --launch-template-name $LAUNCH_TEMPLATE_NAME \
    --version-description "Initial version" \
    --launch-template-data '{
      "ImageId": "ami-xxxxxxxx", 
      "InstanceType": "t2.micro", 
      "KeyName": "my-key-pair", 
      "SecurityGroupIds": ["sg-xxxxxxxx"], 
      "UserData": "'"$(base64 -w 0 setup-apache.sh)"'"
    }'

# Create Auto Scaling Group
aws autoscaling create-auto-scaling-group --auto-scaling-group-name $AUTO_SCALING_GROUP_NAME \
    --launch-template "LaunchTemplateName=$LAUNCH_TEMPLATE_NAME,Version=1" \
    --min-size $MIN_INSTANCES --max-size $MAX_INSTANCES --desired-capacity $DESIRED_INSTANCES \
    --vpc-zone-identifier "$VPC_SUBNETS"
