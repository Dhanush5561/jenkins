pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t mvn_docker .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub-creds', url: '') {
                    sh 'docker tag mvn_docker dhanush5561/mvn_docker:$BUILD_NUMBER'
                    sh 'docker push dhanush5561/mvn_docker:$BUILD_NUMBER'
                }
            }
        }
        stage('Deploy Step') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub-creds', url: '') {
                    sh 'docker rm -f tom_docker || true'
                    sh 'docker run -itd -p 8070:8080 --name tom_docker mvn_docker'
                }
            }
        }
    }
}
