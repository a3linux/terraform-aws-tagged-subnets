Name Subnets - fetch AWS subnets with tags
=========================================

A simple terraform module to fetch AWS Subnets information based on given tags.
For case that VPC/Subnets are not created or maintenance by same team or VPC/Subnets are already there.

# Input and output

Input should be subnets name tag(wild character are supported) or any other existed subnets tags(terraform map), 

```
tags = {
    TagName = TagValue
        ...
}
```

vpc_id, cidr_blocks, owner_id and all VPC tags are available from the data source.

# Usage

For vpc_id, if it exists, please use **a3linux/tagged-vpc/aws** to fetch it.

````
module "tagged-vpc" {
  source  = "a3linux/tagged-subnets/aws"
  version = "0.1.0"
 
  vpc_id = "vpc-id"
  name = "subnets-name"
  tags = {tag1=value1, tags2=value2}
}
````
