# Deployment Guide

## Prerequisites
- AWS CLI installed and configured
- Proper IAM permissions (AdministratorAccess or equivalent)

## Quick Deploy Steps
1. Clone the repository
2. Run `./scripts/deploy.sh my-stack-name dev`
3. Wait for the deployment to complete.

## Parameters
- **EnvironmentName**: Environment prefix (e.g., dev, prod)
- **VpcCIDR**: CIDR for VPC
- **DBPassword**: Database password

## Post-deployment Verification
Run `./scripts/validate.sh my-stack-name` to ensure stack deployed successfully.

## Troubleshooting
- If stack rolls back, check CloudFormation events in AWS Console for error details.
