# terraform_elasticsearch
Creating a elastic search domain

### Overview
* Create a single node elastic search domain accessible from IPs provided in variable elasticsearch_ips_to_allow_access.
* Customize your settings in variable ef file.
* Takes 10+ minutes for the cluster to comeup.

### Executing
* make changes to main.tf/variables in site folder
* Run the following commands 
  * terraform get site 
  * terraform apply site
  
