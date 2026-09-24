# Cost Optimization

## Compute
EC2 instances use t3.micro for dev, but should be scaled for prod. Use Reserved Instances or Savings Plans for steady state workloads.

## Database
RDS Multi-AZ doubles the cost. For non-prod, consider single AZ.

## Network
NAT Gateways incur hourly and data processing charges. Ensure traffic flowing through NAT is optimized.
