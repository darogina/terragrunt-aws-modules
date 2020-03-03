data "aws_iam_policy_document" "force_mfa" {

  statement {

    sid = "AllowViewAccountInfo"

    effect = "Allow"

    actions = [
      "iam:GetAccountPasswordPolicy",
      "iam:GetAccountSummary",
      "iam:ListUsers",
      "iam:ListVirtualMFADevices"
    ]

    resources = [
      "*"
    ]

  }

  statement {

    sid = "AllowManageOwnPasswords"

    effect = "Allow"

    actions = [
      "iam:ChangePassword",
      "iam:CreateLoginProfile",
      "iam:DeleteLoginProfile",
      "iam:GetLoginProfile",
      "iam:GetUser",
      "iam:UpdateLoginProfile"
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}"
    ]

  }

  statement {

    sid = "AllowManageOwnAccessKeys"

    effect = "Allow"

    actions = [
      "iam:CreateAccessKey",
      "iam:DeleteAccessKey",
      "iam:ListAccessKeys",
      "iam:UpdateAccessKey"
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}"
    ]

  }

  statement {

    sid = "AllowManageOwnSigningCertificates"

    effect = "Allow"

    actions = [
      "iam:DeleteSigningCertificate",
      "iam:ListSigningCertificates",
      "iam:UpdateSigningCertificate",
      "iam:UploadSigningCertificate"
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}"
    ]

  }

  statement {

    sid = "AllowManageOwnSSHPublicKeys"

    effect = "Allow"

    actions = [
      "iam:DeleteSSHPublicKey",
      "iam:GetSSHPublicKey",
      "iam:ListSSHPublicKeys",
      "iam:UpdateSSHPublicKey",
      "iam:UploadSSHPublicKey"
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}"
    ]

  }

  statement {

    sid = "AllowManageOwnGitCredentials"

    effect = "Allow"

    actions = [
      "iam:CreateServiceSpecificCredential",
      "iam:DeleteServiceSpecificCredential",
      "iam:ListServiceSpecificCredentials",
      "iam:ResetServiceSpecificCredential",
      "iam:UpdateServiceSpecificCredential"
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}"
    ]

  }

  statement {

    sid = "AllowManageOwnVirtualMFADevice"

    effect = "Allow"

    actions = [
      "iam:CreateVirtualMFADevice",
      "iam:DeleteVirtualMFADevice"
    ]

    resources = [
      "arn:aws:iam::*:mfa/$${aws:username}"
    ]

  }

  statement {

    sid = "AllowManageOwnUserMFA"

    effect = "Allow"

    actions = [
      "iam:DeactivateMFADevice",
      "iam:EnableMFADevice",
      "iam:ListMFADevices",
      "iam:ResyncMFADevice"
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}"
    ]

  }

  statement {

    sid = "DenyAllExceptListedIfNoMFA"

    effect = "Deny"

    not_actions = [
      "iam:ChangePassword",
      "iam:CreateLoginProfile",
      "iam:CreateVirtualMFADevice",
      "iam:EnableMFADevice",
      "iam:GetAccountPasswordPolicy",
      "iam:GetUser",
      "iam:ListMFADevices",
      "iam:ListUsers",
      "iam:ListVirtualMFADevices",
      "iam:ResyncMFADevice",
      "sts:GetSessionToken"
    ]

    resources = [
      "*"
    ]

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"

      values = [
        "false",
      ]
    }
  }
}
