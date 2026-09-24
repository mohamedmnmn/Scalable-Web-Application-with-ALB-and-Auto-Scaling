#!/bin/bash
set -e

STACK_NAME=$1
if [ -z "$STACK_NAME" ]; then
  echo "Usage: validate.sh <stack-name>"
  exit 1
fi

echo "Validating stack status..."
STATUS=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query "Stacks[0].StackStatus" --output text)
echo "Status: $STATUS"
if [ "$STATUS" == "CREATE_COMPLETE" ] || [ "$STATUS" == "UPDATE_COMPLETE" ]; then
  echo "Stack is valid."
else
  echo "Stack is in invalid state."
  exit 1
fi
