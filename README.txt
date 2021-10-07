Meta Terraform Plans
====================

This describes the meta scope for running the [condi.me github org][1] itself.
Once bootstrapped (i.e. the resources described here have been created by
manually running terraform), then [terraform-plans][2] can be used to
manage resources with significantly less privileges.

Running Terraform
------------------

Terraform 1.0 (or compatible) is needed. You can download a specific version
from the [terraform releases][3] page.

To execute the binary, you will need a consul token (for terraform state)
and access to clone and decrypt [condime/secrets][4] (for provider tokens).

For personal access tokens, secrets can be stored and sourced using [pass][5].

    $ pass edit condi.me/meta-terraform-plans
    $ source <(pass condi.me/meta-terraform-plans)

For group shared access tokens, secrets can be stored using [blackbox][6].

    $ cd ~/src/condime/meta-terraform-plans
    $ source <(blackbox_cat condi.me/meta-terraform-plans)

If you don't have passwordstore or blackbox installed, in a pinch you can
use `git` and `gpg` directly to access the secrets.

With credentials now in the environment, you can now `init` and `plan` the
terraform runs.

    $ cd ~/src/condime/meta-terraform-plans
    $ terraform init
    $ terraform plan -o output.tfplan

Consul ACL Policy
-----------------

State is stored using the consul backend hosted at consul.condi.me, access is
granted with the following Consul ACL Policy.

```hcl
key_prefix "condime/meta_terraform_state" {
  policy = "write"
}

session_prefix "" {
  policy = "write"
}
```

[1]: https://github.com/condime
[2]: https://github.com/condime/terraform-plans
[3]: https://github.com/hashicorp/terraform/releases
[4]: https://github.com/condime/secrets
[5]: https://passwordstore.org
[6]: https://github.com/stackexchange/blackbox
