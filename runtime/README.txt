Managing Terraform resources with geopoiesis
============================================

https://docs.geopoiesis.io/

Setup
-----

First time setup: use a "privileged" account to create

  $ AWS_PROFILE="..."
  $ aws s3 mb s3://${bucket_name}
  $ terraform init
  $ terraform apply

This creates the geopoiesis resources for the application itself

Running geopoiesis itself

  $ source <(pass aws.amazon.com/geopoiesis)

This sets the variables needed to run the app.
You can also retrieve these variables from the saved `state.json` in the precreated s3 bucket.

  $ docker build -t geopoiesis .
  $ docker run --name geopoiesis --rm -p 1983:1983 --env-file .env geopoiesis

Docker is often the quickest way to get started, but you should
move to a production ready host (or PaaS) when ready.
