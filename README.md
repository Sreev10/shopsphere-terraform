# GCP Infrastructure as Code with Terraform

This repository provisions and manages cloud infrastructure on Google Cloud Platform (GCP) using Terraform. It follows a modular architecture supporting environment segregation (`dev`, `qa`, `prod`).

---

## Architecture & Modules

The platform components are broken into isolated modules located in `modules/`:

* **network**: VPC creation, subnets, Cloud Router, Cloud NAT, and firewall rules.
* **gke**: Google Kubernetes Engine cluster and managed node pools.
* **bastion**: Secure compute instance for private cluster administration.
* **cloudsql**: Managed Cloud SQL database instances (PostgreSQL/MySQL).
* **loadbalancer**: External/internal HTTP(S) load balancers.
* **iam**: Service accounts, custom roles, and IAM policy bindings.
* **storage**: Cloud Storage (GCS) buckets with lifecycle management.
* **artifact-registry**: Docker repository for application container images.
* **secret-manager**: Centralized secret storage and IAM access controls.
* **jenkins**: Dedicated CI/CD infrastructure resources.
* **monitoring & logging**: Cloud Monitoring alerts, metric scopes, and Cloud Logging sinks.

---

## Repository Layout

```text
terraform/
├── backend.tf                # Remote backend configuration (GCS)
├── provider.tf               # Google and Google-Beta provider definitions
├── versions.tf               # Terraform and provider version constraints
├── main.tf                   # Root module orchestration
├── variables.tf              # Global input variables
├── outputs.tf                # Root module output definitions
├── locals.tf                 # Global local values
├── environments/             # Environment-specific configuration
│   ├── dev/
│   ├── qa/
│   └── prod/
└── modules/                  # Reusable Terraform modules
    ├── artifact-registry/
    ├── bastion/
    ├── cloudsql/
    ├── gke/
    ├── iam/
    ├── jenkins/
    ├── loadbalancer/
    ├── logging/
    ├── monitoring/
    ├── network/
    ├── secret-manager/
    └── storage/


    Prerequisites
⚬	Terraform >= 1.5.0
⚬	Google Cloud SDK (gcloud)
⚬	Active GCP project with billing enabled
⚬	Proper GCP permissions: Owner or custom IAM roles covering GKE, Compute, Network, and IAM administration
Getting Started

1. Authenticate to GCP
gcloud auth application-default login
gcloud config set project <YOUR_PROJECT_ID>

2. Configure Backend & Variables
	1.	Update backend.tf with your remote GCS bucket name:
    terraform {
      backend "gcs" {
        bucket = "your-terraform-state-bucket"
        prefix = "terraform/state"
      }
    }

    2. Prepare your terraform.tfvars or pass environment variables:

    project_id  = "your-project-id"
    region      = "us-central1"
    environment = "dev"

    3. Deploy

    # Initialize working directory and download provider plugins
     terraform init

    # Validate syntax and configuration
      terraform validate

    # Review the execution plan
     terraform plan -var-file="environments/dev/terraform.tfvars"

     # Apply changes
      terraform apply -var-file="environments/dev/terraform.tfvars"


4. Teardown / Destroy

To destroy all provisioned infrastructure:

terraform destroy -var-file="environments/dev/terraform.tfvars"

