pipeline {
    agent { docker 'postman/newman:alpine' }

    stages {
        stage('check version of newman') {
            steps {
                // Install Newman and any required dependencies
                sh 'newman -v'
            }
        }
        
        stage('Run API Tests') {
            steps {
                // Run the Postman collection using Newman
                sh './collections/scripts/regression.sh'
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
