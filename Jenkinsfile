pipeline {
   agent {
        docker {
            image 'postman/newman'
            args '-u root'
        }
    }

    stages {
        
        
        stage('Run API Tests') {
            steps {
                // Run the Postman collection using Newman
                sh '''
                    newman run collections/register.postman_collection.json \
                    --reporters allure 
                    '''
            }
        }
    }

    post {
                always {
                    allure includeProperties:
                     false,
                     jdk: '',
                     results: [[path: 'collections/allure-results']]
                }
            }
}
