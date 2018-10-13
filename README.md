# Terraform Templates

If you ever worked with IAM policies in Terraform, then you can easily recognize the pain of having similar policies copy pasted at different places with only a few parameters changed. One of the common examples is to create multiple users with the same permissions, in which you have an exactly same policy at multiple places. Another example is to give multiple users permissions of different S3 buckets. Copy pasting same policy for different users or buckets creates a lot of redundancy, the chance of error and pain to manage them.

All these common permissions can be moved to a single file with few dynamic parameters which can be changed based on requirement. This can be done using templates which are data-sources defined by a file. We define variables to use in these templates which rendered in the final result used in resources. We can use any built-in functions in our templates to bring dynamic behavior to them. Data with type template_file is used for our use-case to read the content of template and render.

Commands used:

terraform init : Initialize a Terraform working directory

terraform plan : Generate and show an execution plan

terraform apply : Builds or changes infrastructure

terraform destroy : Destroy Terraform-managed infrastructure