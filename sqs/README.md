## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| AWS\_ACCOUNT |  | string | n/a | yes |
| sqs\_DELAY\_SECONDS |  | string | `"0"` | no |
| sqs\_MESSAGE\_RETENTION\_SECONDS |  | string | `"345600"` | no |
| sqs\_RECEIVE\_WAIT\_TIME\_SECONDS |  | string | `"0"` | no |
| sqs\_VISIBILITY\_TIMEOUT\_SECONDS |  | string | `"30"` | no |
| sqs\_max\_msg\_size |  | string | n/a | yes |
| sqs\_name |  | string | n/a | yes |
| sqs\_redrive\_policy |  | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| sqs\_arn |  |
