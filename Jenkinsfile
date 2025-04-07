pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'https://index.docker.io/v1/'  
        DOCKER_CREDENTIALS_ID = 'docker-hub'  
    }

    stages {
        stage('Build Artifact') {
            steps {
                sh 'mvn clean package -DskipTests=true'
                archiveArtifacts artifacts: 'target/*.jar', allowEmptyArchive: true
            }
        }

        stage('Unit Test and Jacoco') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                    jacoco execPattern: 'target/jacoco.exec'
                }
            }
        }

        stage('Docker Build and Push') {
            steps {
                withDockerRegistry([credentialsId: DOCKER_CREDENTIALS_ID, url: DOCKER_REGISTRY]) {
                    sh 'docker build -t akhilyechuri064/devops:"${GIT_COMMIT}" .'
                    sh 'docker push akhilyechuri064/devops:"${GIT_COMMIT}"'
                    sh 'docker run -p 4499:4499 akhilyechuri064/devops:"${GIT_COMMIT}'
                }
            }
        }
    }
}
