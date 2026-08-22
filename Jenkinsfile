pipeline {
    agent any

    options {
        disableConcurrentBuilds()
        timestamps()
    }

    stages {

        stage('Terraform Version') {
            steps {
                dir('terraform') {
                    sh 'terraform version'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Destroy Plan') {
            steps {
                dir('terraform') {
                    sh '''
                        rm -f tfplan-destroy
                        terraform plan -destroy -out=tfplan-destroy
                    '''
                }
            }
        }

        stage('Destroy Infrastructure') {
            steps {
                input message: 'Destroy ALL Terraform-managed infrastructure in GCP?', ok: 'Destroy'

                dir('terraform') {
                    sh 'terraform apply -auto-approve tfplan-destroy'
                }
            }
        }
    }

    post {
        success {
            echo 'Terraform infrastructure destruction completed successfully.'
        }

        failure {
            echo 'Terraform infrastructure destruction failed. Check the Jenkins console output.'
        }

        always {
            echo 'Terraform destroy pipeline finished.'
        }
    }
}
