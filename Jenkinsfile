pipeline {
    agent any

        stages {
            stage('terraform init') {
                steps {
                    withAWS(credentials: 'aws', region: 'us-east-1'){
                    sh 'terraform init '}
                }
            }

            stage('terraform apply') {
                steps {
                    withAWS(credentials: 'aws', region: 'us-east-1'){
                    sh 'terraform apply --auto-approve -no-color '}
                    }
            }
        }
        
    }