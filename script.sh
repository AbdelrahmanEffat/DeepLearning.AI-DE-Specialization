# Detach all managed policies
for policy in $(aws iam list-attached-role-policies --role-name de-c4w4a1-glue-role --query 'AttachedPolicies[*].PolicyArn' --output text); do
  aws iam detach-role-policy --role-name de-c4w4a1-glue-role --policy-arn $policy
done

# Delete all inline policies
for policy in $(aws iam list-role-policies --role-name de-c4w4a1-glue-role --query 'PolicyNames[*]' --output text); do
  aws iam delete-role-policy --role-name de-c4w4a1-glue-role --policy-name $policy
done

# Delete the role
aws iam delete-role --role-name de-c4w4a1-glue-role