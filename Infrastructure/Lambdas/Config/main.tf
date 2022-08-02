locals {
  prefix   = "sample-project"
  jar_path = "${path.cwd}/${one(fileset(".","./app/target/sample-project-config-*-aws.jar"))}"

  common_tags = {
    Environment = "dev"
    Project     = "SampleProject"
  }
}


