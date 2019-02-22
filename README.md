# Shopline ECS Module Terraform Template 

#### ver 1.0.0

#

### Structure

```
|-- README.md
|-- ec2
|   |-- ec2.tf
|   |-- scripts
|   |   `-- init.cfg
|   `-- vars.tf
|-- ecs_cluster
|   |-- cluster.tf
|   |-- output.tf
|   `-- vars.tf
|-- ecs_service
|   |-- service.tf
|   `-- vars.tf
|-- lb_http
|   |-- lb.tf
|   |-- output.tf
|   `-- vars.tf
|-- lb_https
|   |-- listener_https.tf
|   |-- output.tf
|   `-- vars.tf
|-- subnets
|   |-- outpur.tf
|   |-- subnets.tf
|   `-- vars.tf
|-- vpc
|   |-- output.tf
|   |-- vars.tf
|-- `-- vpc.tf

```

#

### Usage

Every Modules has `main` / `vars` / `outputs` three files.

`main.tf`   : resources 

`vars.tf`   : variables that resource needed

`outputs.tf`: resource ID that other resource needed

