#!/bin/bash

declare -A exception_list
declare -A temp_list

# User input values
env_type_value=$1
region=$2
exception_list=$3

# Validating the user inputs
if [ "$env_type_value" != "" ] && [ "$region" != "" ]
then
# Describing instances with filters to fetch instance-id list
temp_list=$(eval "aws ec2 describe-instances --region $region --filters "Name=tag:Environment,Values=$env_type_value" --query Reservations[].Instances[].InstanceId --output text")

# Validating instance list
if [ "$temp_list" != "" ]
then

temp01=$(echo ${temp_list[@]} ${exception_list[@]} | tr ' ' '\n' | sort | uniq -u | tr '\n' ' ')

# Stopping all the instances in the list
starting_instance=$(aws ec2 start-instances --region $region --instance-ids $temp01)
echo "Following instances are started in the $region region,"
echo -e "\t$temp01"
else
echo "No Instance found. Please check the following tag values for $region region"
echo -e "\tEnvironment: $env_type_value"
fi
else
echo -e "Environment and region value will not be empty"
fi
