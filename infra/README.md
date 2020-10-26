# Big Data ProCamp Google Cloud Infrastructure

## Introduction

### About this guide

This guide will help you quickly prepare Google Cloud environment for Big Data ProCamp.

As you follow this guide, you'll use Terraform to provision, update, and destroy
a simple set of infrastructure using the configuration provided.

## Setup Google Cloud Free Trial

Google Cloud provides The Free Trial program. New users have 90 days to use their $300 USD in Google Cloud credits.
$300 USD credits amount should be enough to run the infrastructure and complete the labs during Big Data ProCamp.
You can find more details about GCP free programs on [GCP web site](https://cloud.google.com/blog/products/gcp/getting-started-with-google-cloud-for-free)

Folllow the instructions to register Google Cloud account and activate [free trial](https://cloud.google.com/free/).

## Create Google Cloud Project

To create a new project:

1. Go to the [Manage resources page](https://console.cloud.google.com/cloud-resource-manager) in the Cloud Console.
2. Click Create Project.
In the New Project window that appears, enter a `bigdata-procamp` as a project name.
3. Leave `No organization` as a location for your project.

When you're finished entering new project details, click Create.

### Google Cloud Shell

This guide uses Google Cloud Shell to give you an environment preconfigured with Terraform. You can run commands at the command prompt, and edit the files in the editor window.

If you'd prefer to follow this tutorial on your local machine, you can follow [this guide on learn.hashicorp.com](https://learn.hashicorp.com/terraform/gcp/intro).


## Installing Terraform

Terraform is already install in your Cloud Shell environment. You can verify this by running:

```bash
terraform --version
```

If you'd like to install Terraform on your local machine, you can [follow the instructions here](https://learn.hashicorp.com/terraform/gcp/install).

### Note: Terraform versions

When running the previous command, you may see a warning that there is a newer version of Terraform available. This guide has been tested with the version of Terraform installed in your Cloud Shell environment, so please continue to use it for the rest of the guide.

## Installing Google Cloud SDK (optional)

You can run terraform scripts from your local machine instead of using Google Cloud Shell. If you prefer to proceed
with you would nee to install Google Cloud SDK by [following the the instructions here](https://cloud.google.com/sdk/docs/install).

After you install Cloud SDK, the next step is to run the `gcloud init` command to perform initial setup steps.  Pick `bigdata-procamp` as cloud project to use when prompted.

## Create Google Cloud Project

### Setup the environment

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https%3A%2F%2Fgithub.com%2Fadruzenko%2Fbigdata-procamp&cloudshell_git_branch=infra&cloudshell_open_in_editor=terraform%2Fdataproc%2Fdataproc.tf&cloudshell_working_dir=infra&cloudshell_tutorial=README.md)

1. Set your billing account id

Lookup you billing account id:
```sh
$ gcloud beta billing accounts list
```

Export Billing Account ID as environment variable, replace `YOUR_ACCOUNT_ID` with your billing account id from the output of the previous command (ex. `02221D-02221E-82221C`).

```sh
export TF_VAR_billing_account=YOUR_ACCOUNT_ID
```