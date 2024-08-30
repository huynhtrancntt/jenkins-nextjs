pipeline {
    agent any
    
    tools {
        nodejs "nodejs"
    }

    stages {
       
        stage("install") {
            steps {
                echo "install"
                sh 'npm install'
            }
        }
        stage("build") {
            steps {
                echo "build"
                sh 'npm run build'
            }
        }
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
