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
        stage('install') {
            steps {
                echo "install"
                sh 'npm install'
            }
        }
        stage('build') {
            steps {
                echo "build"
                sh 'npm run build'
            }
        }

        stage('clear') {
            steps {
                echo "Clearing build data"
                sh 'rm -rf node_modules'
                sh 'rm -rf dist'
            }
        }
        stage('clean-git') {
            steps {
                echo "Cleaning Git repository"
                sh 'git clean -fdx'
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
