#!/bin/bash                                                                                                                                                              1 aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId]" --output text --profile $1 --region eu-west-1 |
while read line;
do
    echo $line;
    aws ec2 modify-instance-attribute  --output text --profile $1 --region eu-west-1 --instance-id $line --disable-api-termination "{\"Value\": false}";
done
