
# kpmg-challenge
Contains solution for the challenge 


## Challenge-1

In this challenge I have created aws 3-tier architecture usign terraform v12 and structure the code using reusable pattern.

The high level stack are.

* environments
* global
* stage
* modules

The reusbale terraform resources are kept in modules, where as root modules are mainly consumed from stage (Implies staging environment, similarly can be prod and sandbox),

each environment module stack like stage consist of services and vpc(assuming each env is deployed into separate vpc for isolation).
services consist of frontend, storage etc aws services

![dir_structure](https://user-images.githubusercontent.com/65091252/120243531-bf2cd480-c25f-11eb-8d4e-aa95fb3fecea.JPG)

*The __global folder__ is a container for stuff like s3 for remote backend, kms keys , route-53  or iam*

And the __environment folder__ contains the input values for each environment like sandbox, nonprod and production and used when running terraform either from local developer machine or build server like Jenkins.

```
terraform plan  --var-file="../../environments/staging.tfvars"
terraform apply  --var-file="../../environments/staging.tfvars"
```

Infra Details:-

* VPC with two public subnets and private subnet
* Nat gateway to provide internet access to the resources in private subnet
* mysql RDS Db in Private subnet
* ALB which points to ASG
* App servers and installed httpd service with terraform userdata
* Security groups has are accessible from my IP which can be modified to organisation cidr ranges and can be changed as
  per requirement at the time of deployment
* Bastion host to provide ssh access to resources in private subnet

Recommendation / Improvements:-

* route53 record can be implemented with static page hosting in s3 when main app server fails for web-request
* Its been assume asg layer is stateless, if it stores state efs/dfs drive can be mounted on bootup
* Alsofor more complex requirement we can put caching server infront of database to reduce latency and improve speed of common queries

**Reference Architecture**
![kpmg-aws-infra](https://user-images.githubusercontent.com/65091252/120246055-09fe1a80-c267-11eb-91bc-0c5062de48ed.jpg)

## Challenge-2
For this challenge I have used python to solve this problem to get ec2 metadata and then used findval function to pass instanceId and get the value
Example
```
cmd: python query-metadata.py instanceId
```
![img](https://user-images.githubusercontent.com/65091252/120244405-01571580-c262-11eb-9376-d7353a6dbef2.png)

## Challenge-3
For this challenge I have used python to resolve this problem by spliting the key and create findval function to filter out the value from the given object
Example
```
cmd: python find-value-1.py 
cmd: python find-value-2.py 
```
