#!/bin/bash
set -e

STACK_NAME=$1
if [ -z "$STACK_NAME" ]; then
  echo "Usage: cleanup.sh <stack-name>"
  exit 1
fi

read -p "Are you sure you want to delete stack $STACK_NAME? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Emptying S3 buckets..."
  BUCKET=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query "Stacks[0].Outputs[?OutputKey=='StaticAssetsBucket'].OutputValue" --output text || true)
  if [ ! -z "$BUCKET" ] && [ "$BUCKET" != "None" ]; then
    aws s3 rm s3://$BUCKET --recursive || true
  fi

  echo "Deleting stack..."
  aws cloudformation delete-stack --stack-name $STACK_NAME
  echo "Waiting for stack deletion to complete..."
  aws cloudformation wait stack-delete-complete --stack-name $STACK_NAME
  echo "Cleanup complete."
fi
