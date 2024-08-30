pipeline {
    agent any
    
    tools {
        nodejs "20.12.2"
    }

    stages {
       stage('version') {
            steps {
                script {
                    // In ra phiên bản npm
                    sh 'npm version'
                }
            }
        }
        // stage("install") {
        //     steps {
        //         echo "install"
        //         sh 'npm install'
        //     }
        // }
        // stage("build") {
        //     steps {
        //         echo "build"
        //         sh 'npm run build'
        //     }
        // }
    } 
    
    post {
        success {
            echo "SUCCESSFUL"
        }
        failure {
            echo "FAILED"
        }

    }
}
