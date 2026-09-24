# Security

## Network Security
The architecture uses public and private subnets. Only public subnets have direct internet access via IGW. Private subnets route through NAT Gateways. Database subnets are completely isolated.

## WAF Configuration
AWS WAF is attached to the ALB, using AWS Managed Rules (CommonRuleSet) to protect against OWASP Top 10 vulnerabilities.

## Encryption
- **In transit**: ALB redirects HTTP to HTTPS (certificate required in prod).
- **At rest**: RDS is deployed with standard encrypted EBS volumes in a production scenario (update template to enable KMS encryption).

## IAM
EC2 instances use an Instance Profile restricted to Session Manager access (AmazonSSMManagedInstanceCore).

## Compliance
Consider enabling AWS Config and Security Hub for continuous compliance monitoring.
