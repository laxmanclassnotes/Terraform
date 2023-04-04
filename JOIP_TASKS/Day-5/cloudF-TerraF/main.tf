# From terraform template 
resource "aws_cloudformation_stack" "cfterraform" {
  name          = "terraformcf"
  template_body = file("c:/users/laxma/TERRAFORM-NOTES/Terraform/CloudFormation/BASIC-TASKS-CF/activity2.json")
}