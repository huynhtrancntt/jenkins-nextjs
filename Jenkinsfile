pipeline {
    agent any

    tools {
        nodejs "20.12.2"
    }

    stages {

            // stage('Clone')
            // {
            //     steps {
            //             git 'https://github.com/huynhtrancntt/angular-app-15.2.git'
            //     }

            // }

            // stage('docker-build')
            // {
            //     environment {
            //         DOCKER_TAG="${GIT_BRANCH.tokenize('/').pop()}-${GIT_COMMIT.substring(0,7)}"
            //     }
            //     steps {

            //         echo "${DOCKER_IMAGE}:${DOCKER_TAG}";
            //         sh 'docker --version'
            //         sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'

            //         withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
            //                         // some block
            //             sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
            //             // sh "docker push ${DOCKER_IMAGE}:latest"
                                    

            //         }
                    

            //         sh "docker image rm ${DOCKER_IMAGE}:${DOCKER_TAG}"
            //     }
            // }

            // stage('ssh server')
            // {
            //     steps {

            //             echo 'ssh server';
            //              sh 'id'
            //         sshagent(['ssh-remove']) {
            //                 // some block
            //                 echo 'ssh-remove'

            //                 sh 'ssh -o StrictHostKeyChecking=no -l root 192.168.20.110 uname -a'
            //                 sh 'ssh -o StrictHostKeyChecking=no -l root 192.168.20.110 cat hello.txt'
            //                 sh 'ssh -o StrictHostKeyChecking=no -l root 192.168.20.110 docker ps'
            //                 echo 'ssh-remove-2'

            //         }
            //     }
            // }

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
