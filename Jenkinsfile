pipeline {
    agent any

    tools {
        nodejs "20.12.2"
    }

    stages {
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
        stage('fix-npm-permissions') {
            steps {
                echo "Fixing npm permissions"
                sh 'sudo chown -R $(id -u):$(id -g) ~/.npm'
            }
        }
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
                sh 'npm install --cache ~/.npm'
            }
        }
        stage('build') {
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
