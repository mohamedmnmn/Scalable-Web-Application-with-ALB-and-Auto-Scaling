#!/bin/bash
set -e

STACK_NAME=$1
ENV=$2
if [ -z "$STACK_NAME" ]; then
  echo "Usage: deploy.sh <stack-name> <environment>"
  exit 1
fi
if [ -z "$ENV" ]; then ENV="Production"; fi

echo "Validating template..."
aws cloudformation validate-template --template-body file://templates/main.yaml

echo "Deploying stack $STACK_NAME..."
aws cloudformation deploy \
  --template-file templates/main.yaml \
  --stack-name $STACK_NAME \
  --parameter-overrides EnvironmentName=$ENV DBPassword=SecurePassword123! \
  --capabilities CAPABILITY_NAMED_IAM \
  --no-fail-on-empty-changeset

echo "Deployment complete."
