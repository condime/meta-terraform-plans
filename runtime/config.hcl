# This backend is only used to store ephemeral
# plans and thhe run workspace. It does not
# become the backend for the terraform state itself.
backend {
  aws {
    region {
      environment {
        variable = "AWS_REGION"
      }
    }

    kms_key_id {
      environment {
        variable = "AWS_KMS_KEY_ID"
      }
    }

    s3_bucket {
      environment {
        variable = "AWS_S3_BUCKET"
      }
    }

  }
}

admin {
  domain = "admin-geopoiesis.condi.me"

  identity {
    github {
      client_id {
        environment {
          variable = "ADMIN_GITHUB_CLIENT_ID"
        }
      }

      client_secret {
        environment {
          variable = "ADMIN_GITHUB_CLIENT_SECRET"
        }
      }
      
      permissions {
        # https://github.com/orgs/condime/teams/admins/
        team "2891325" {
          write = true
        }
      }
    }
  }
}

scope "meta" {
  domain = "meta-geopoiesis.condi.me"

  identity {
    github {
      client_id {
        environment {
          variable = "META_GITHUB_CLIENT_ID"
        }
      }

      client_secret {
        environment {
          variable = "META_GITHUB_CLIENT_SECRET"
        }
      }
      
      permissions {
        # https://github.com/orgs/condime/teams/admins/
        team "2891325" {
          write = true
        }
      }
    }
  }

  source {
    github {
      repository     = "condime/meta-terraform-plans"
      tracked_branch = "master"

      app_id          = "30588"
      installation_id = "949131"

      app_key {
        environment {
          variable = "META_GITHUB_APP_KEY"
          encoding = "base64"
        }
      }

      webhook_secret {
        environment {
          variable = "META_GITHUB_WEBHOOK_SECRET"
        }
      }
    }
  }

}

scope "condime" {
  domain = "geopoiesis.condi.me"

  identity {
    github {
      client_id {
        environment {
          variable = "GITHUB_CLIENT_ID"
        }
      }

      client_secret {
        environment {
          variable = "GITHUB_CLIENT_SECRET"
        }
      }
      
      permissions {
        # https://github.com/orgs/condime/teams/admins/
        team "2891325" {
          write = true
        }
      }
    }
  }

  source {
    github {
      repository     = "condime/terraform-plans"
      tracked_branch = "master"

      app_id          = "30564"
      installation_id = "948114"

      app_key {
        environment {
          variable = "GITHUB_APP_KEY"
          encoding = "base64"
        }
      }

      webhook_secret {
        environment {
          variable = "GITHUB_WEBHOOK_SECRET"
        }
      }
    }
  }
}
