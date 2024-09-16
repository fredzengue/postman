pipeline {
    agent { docker 'node:hydrogen-alpine' }

    stages {
        stage('Install Dependencies') {
            steps {
                // Install Newman and any required dependencies
                sh 'npm install -g newman'
            }
        }
        
        stage('Run API Tests') {
            steps {
                // Run the Postman collection using Newman
                sh '/collections/scripts/regression.sh'
            }
        }
    }

    post {
                always {
                    allure includeProperties:
                     false,
                     jdk: '',
                     results: [[path: 'build/allure-results']]
                }
            }
}
