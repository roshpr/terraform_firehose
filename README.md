# AWS firehose support for VPC flow log analysis.
Creating a ELK infra for monitoring & analysing VPC network flow using the VPC flow log. This is achieved by using AWS components like Firehose, Elasticsearch & Lambda.
The Lambda code is an enhancement on https://github.com/awslabs/aws-vpc-flow-log-appender code to include VPC related statistics.

### Overview
* Create a single node elastic search domain accessible from IPs provided in variable elasticsearch_ips_to_allow_access.
* Customize your settings in variable tf file & IAM policies.
* Takes 10+ minutes for the cluster to comeup.

### Executing
* make changes to main.tf/variables in site folder
* Run the following commands 
  * terraform get site 
  * terraform apply site
* Currently datatransformation is not supported by any of the AWS API like bots, cloudformation etc.
** We will need to manually add support for data transformation into Firehose once the basic infra structure is created.
** Edit the firehose delivery stream & enable data transformation. 
** Choose the vpc-flow-log-appender-dev-FlowLogDecoratorFunction Lambda function.
** Chhose Lambda function runtime to nodejs6.10
** Choose Lambda timeout to 5 mins
** Choose Lambda function version as latest.
** Submit your changes
