pipeline {
    agent any
    environment {
        TF_DIR = 'terraform'
        GOOGLE_PROJECT = 'gke-project-1-500610'
    }
    stages {
        stage ('checkout') {
            steps {
                checkout scm
            }
        }
        stage ('Terraform Version') {
            steps {
                dir ("${TF_DIR}") {
                    sh 'terraform version'
                }
            }
        }
        stage ('Terraform init') {
            steps {
                dir ("${TF_DIR}") {
                    sh 'terraform init'
                }
            }
        }
        stage ('Terraform format check') {
            steps {
                dir ("${TF_DIR}") {
                    sh 'terraform fmt -check -recursive'
                }
            }
        }
        stage ('Terraform validate') {
            steps {
                dir ("${TF_DIR}") {
                    sh ' terraform validate'
                }
            }
        }
        stage ('Terraform plan') {
            steps {
                dir ("${TF_DIR}") {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage ('Terraform apply') {
            steps {
                input message: 'Terraform plan is ready. Deploy insfrastructure to GCP' ,
                ok: 'Deploy'
                dir ("${TF_DIR}") {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
    post {
        success {
            echo 'Insfracture deployment completed successfully.'
        }
        failure {
            echo 'Insfracture deploment failed. check the jenkins console logs.'
        }
    }
}