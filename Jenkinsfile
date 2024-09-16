pipeline {
    agent { docker 'postman/newman:alpine' }

    stages {
        // stage('check version of newman') {
        //     steps {
        //         // Install Newman and any required dependencies
        //         sh 'newman -v'
        //     }
        // }
        
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
