#providers

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_iam_user" "instanceManageUser" {
  name = "instanceManageUser"
}

resource "aws_iam_access_key" "instanceManageUser" {
  user = "${aws_iam_user.instanceManageUser.name}"
}

data "template_file" "policy" {
  template = "${file("${path.module}/policy.json")}"

  vars {
    bucket_name = "dummy_bucket"
  }
}

resource "aws_iam_user_policy" "instanceManageUser_assume_role" {
  name = "InstanceManagePolicy"
  user = "${aws_iam_user.instanceManageUser.name}"

  policy = "${data.template_file.policy.rendered}"
}
