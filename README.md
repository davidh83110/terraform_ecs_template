# Shopline ECS Module Terraform Template 

#### ver 1.0.0

#

### Structure

```
.
├── README.md
├── asg
│   ├── asg.tf
│   ├── output.tf
│   └── vars.tf
├── ec2
│   ├── ec2.tf
│   ├── scripts
│   │   └── init.cfg
│   └── vars.tf
├── ecs_cluster
│   ├── cluster.tf
│   ├── output.tf
│   └── vars.tf
├── ecs_service
│   ├── service.tf
│   └── vars.tf
├── ecs_service_nonLB
│   ├── service.tf
│   └── vars.tf
├── lb_http
│   ├── lb.tf
│   ├── output.tf
│   └── vars.tf
├── lb_https
│   ├── listener_https.tf
│   ├── output.tf
│   └── vars.tf
├── listener_http
│   ├── listener_http.tf
│   ├── output.tf
│   └── vars.tf
├── route53_internal_shopline
│   ├── route53.tf
│   └── vars.tf
├── sqs
│   ├── output.tf
│   ├── sqs.tf
│   └── vars.tf
├── subnets_app
│   ├── output.tf
│   ├── subnets_app.tf
│   └── vars.tf
├── subnets_public
│   ├── output.tf
│   ├── subnets_public.tf
│   └── vars.tf
└── vpc
    ├── output.tf
    ├── vars.tf
    └── vpc.tf


```

#

### Usage

Every Modules has `main` / `vars` / `outputs` three files.

`main.tf`   : resources 

`vars.tf`   : variables that resource needed

`outputs.tf`: resource ID that other resource needed

