provider "aws" {
  region = "ap-northeast-1"
  alias  = "member-ap-northeast-1"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "ap-northeast-2"
  alias  = "member-ap-northeast-2"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "ap-south-1"
  alias  = "member-ap-south-1"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "member-ap-southeast-1"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "ap-southeast-2"
  alias  = "member-ap-southeast-2"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "ca-central-1"
  alias  = "member-ca-central-1"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "eu-central-1"
  alias  = "member-eu-central-1"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "eu-north-1"
  alias  = "member-eu-north-1"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "eu-west-1"
  alias  = "member-eu-west-1"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "eu-west-2"
  alias  = "member-eu-west-2"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "eu-west-3"
  alias  = "member-eu-west-3"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "sa-east-1"
  alias  = "member-sa-east-1"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "member-us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "us-east-2"
  alias  = "member-us-east-2"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "us-west-1"
  alias  = "member-us-west-1"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "us-west-2"
  alias  = "member-us-west-2"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

