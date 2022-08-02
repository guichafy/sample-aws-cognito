# Cognito

### How To Run 

Ex:
```
export TF_CLI_ARGS_init="-backend-config='state-bucket=bucket-lab-states-terraform'"
export TF_CLI_ARGS_init="$TF_CLI_ARGS_init -backend-config='key=states/authorizer.json'"
export TF_CLI_ARGS_init="$TF_CLI_ARGS_init -backend-config='state-region=sa-east-1'"
``` 


### Refs:

 - [Cognito Terraform Dynamic Blocks](https://alexopensource.wordpress.com/2021/04/03/creating-nested-conditional-dynamic-terraform-blocks/)