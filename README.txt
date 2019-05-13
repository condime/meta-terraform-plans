Terraform Plans
===============

This describes the meta scope for running geopoiesis itself.
Once bootstrapped (i.e. the resources described here have
been created by manually running terraform), then geopoiesis
can be used to manage itself (very useful for managing _other_
scopes).


Running Geopoiesis
------------------

https://docs.geopoiesis.io/manual/running

Docker, or a docker compatible PaaS is usually the quickest way
to get an instance of geopoiesis working. You should use whatever
hosting/compute platform that you are most comfortable with.

The Geopoiesis application is distributed as a staticically
linked go binary, packaged in a docker container image.
https://hub.docker.com/r/geopoiesis/geopoiesis/tags

Any linux/amd64 environment will do, and the binary _does not_
use root privileges. It is best to create an unprivileged user
for geopoiesis.

    $ sudo useradd -b /var/lib -m -r geopoiesis

To execute the binary, you will need a config file with secrets
typically stored in the environment. Here's an example systemd
unit file to explain.

```
[Unit]
Description=Geopoiesis Service

[Service]
EnvironmentFile=/etc/geopoiesis/environment
ExecStart=/usr/bin/geopoiesis --config=/etc/geopoiesis/config.hcl

User=geopoiesis
Group=geopoiesis

[Install]
WantedBy=multi-user.target
```
The environment file sets the following variables:
(chown/chmod: root/600, only needs to be read by systemd)

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION
AWS_KMS_KEY_ID
AWS_S3_BUCKET

These grant the Geopoiesis App to the resources it needs to run itself
and are created by the modules managed by this repository (yeah, weird, I know).
Docs: https://docs.geopoiesis.io/manual/app-setup/aws-setup
Definitions: https://github.com/geopoiesis/terraform

ADMIN_GITHUB_CLIENT_ID
ADMIN_GITHUB_CLIENT_SECRET

A dedicated github app to authenticate `admin-geopoiesis.condi.me`.

META_GITHUB_CLIENT_ID
META_GITHUB_CLIENT_SECRET
META_GITHUB_APP_KEY
META_GITHUB_WEBHOOK_SECRET

A dedicated github app to authenticate `meta-geopoiesis.condi.me`,
also used to accept webhooks and apply runs for `condime/meta-terraform-plans`.

GITHUB_CLIENT_ID
GITHUB_CLIENT_SECRET
GITHUB_APP_KEY
GITHUB_WEBHOOK_SECRET

A dedicated github app to authenticate `geopoiesis.condi.me`,
also used to accept webhooks and apply runs for `condime/terraform-plans`.

There are examples of the `environment` and `config.hcl` are available
under in the `runtime/` directory of this repository.

Finally, expose the application to the internet, e.g. with nginx and
appropriate DNS records.

```
server {
        listen 443 ssl http2;
        listen [::]:443 ssl http2;

        ssl_certificate /etc/letsencrypt/live/geopoiesis.condi.me/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/geopoiesis.condi.me/privkey.pem;

        server_name admin-geopoiesis.condi.me;
        server_name meta-geopoiesis.condi.me;
        server_name geopoiesis.condi.me;

        location / {
                proxy_pass              http://geopoiesis:1983/;
                proxy_redirect          off;
                proxy_http_version      1.1;
                proxy_set_header        Host $http_host;
                proxy_set_header        Connection $connection_upgrade;
                proxy_set_header        Upgrade $http_upgrade;
        }
}
```

Geopoiesis Environment
----------------------

These variables are set in the Environmment tab so that per-run state
is saved in S3. You don't need to use backend locking (geopoiesis
itself becomes the lock as all runs are serialised by the queue).

TF_CLI_ARGS_init

  -backend-config='access_key=...' \
  -backend-config='secret_key=...' \
  -backend-config='bucket=$bucket' \
  -backend-config='key=$statefile' \
  -backend-config='region=...' 

This AWS user only needs access to manupaulate the state file.
If you are not using the s3 backend, you don't need to create this AWS user.

Example IAM Policy:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::$bucket/$statefile",
                "arn:aws:s3:::$bucket/$another_statefile"
            ]
        },
        {
            "Effect": "Allow",
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::$bucket"
        }
    ]
}

```

The following variables are only needed to configure terraform providers.

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION

If you want to use the "aws" provider, then set these variables.
This user will need full access to manipaulate any AWS resources you create.
Consider using the `AdministratorAccess` AWS Managed Policy in a dedicated
AWS Account, or create your own restricted policy.

GITHUB_TOKEN
GITHUB_ORGANIZATION

If you want to manage github organization resources, then set these variables.
This user will need the following access rights.

- `public_repo` (or `repo` if you are creating private repositories)
- `admin:org`
  - `write:org`
  - `read:org`

This is enough to create teams, manage memberships and organize repositories.
Consider adding `admin:repo_hook` and `admin:org_hook` if you need them.
