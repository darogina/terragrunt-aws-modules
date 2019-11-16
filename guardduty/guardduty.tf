module "guardduty_baseline_ap-northeast-1" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-ap-northeast-1
    aws.member = aws.member-ap-northeast-1
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["ap-northeast-1"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_ap-northeast-2" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-ap-northeast-2
    aws.member = aws.member-ap-northeast-2
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["ap-northeast-2"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_ap-south-1" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-ap-south-1
    aws.member = aws.member-ap-south-1
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["ap-south-1"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_ap-southeast-1" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-ap-southeast-1
    aws.member = aws.member-ap-southeast-1
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["ap-southeast-1"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_ap-southeast-2" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-ap-southeast-2
    aws.member = aws.member-ap-southeast-2
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["ap-southeast-2"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_ca-central-1" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-ca-central-1
    aws.member = aws.member-ca-central-1
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["ca-central-1"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_eu-central-1" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-eu-central-1
    aws.member = aws.member-eu-central-1
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["eu-central-1"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_eu-north-1" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-eu-north-1
    aws.member = aws.member-eu-north-1
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["eu-north-1"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_eu-west-1" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-eu-west-1
    aws.member = aws.member-eu-west-1
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["eu-west-1"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_eu-west-2" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-eu-west-2
    aws.member = aws.member-eu-west-2
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["eu-west-2"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_eu-west-3" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-eu-west-3
    aws.member = aws.member-eu-west-3
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["eu-west-3"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_sa-east-1" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-sa-east-1
    aws.member = aws.member-sa-east-1
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["sa-east-1"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_us-east-1" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-us-east-1
    aws.member = aws.member-us-east-1
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["us-east-1"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_us-east-2" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-us-east-2
    aws.member = aws.member-us-east-2
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["us-east-2"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_us-west-1" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-us-west-1
    aws.member = aws.member-us-west-1
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["us-west-1"]}"
  member_account_email = "${var.member_account_email}"
}

module "guardduty_baseline_us-west-2" {
  source = "../utility/enable-guardduty-in-one-region"

  providers = {
    aws.master = aws.master-us-west-2
    aws.member = aws.member-us-west-2
  }

  master_account_id    = "${var.master_account_id}"
  master_detector_id   = "${var.master_detector_ids["us-west-2"]}"
  member_account_email = "${var.member_account_email}"
}
