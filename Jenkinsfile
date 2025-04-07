pipeline {
  agent any 
   environment {
        DOCKER_REGISTRY = 'https://index.docker.io/v1/'  
        DOCKER_CREDENTIALS_ID = 'docker-hub'  
    }
  stages {
    stage(' build artifact ') {
      steps{
        sh 'mvn clean package -DskipTests=true'
        archiveArtifacts artifacts: 'target/*.jar', allowEmptyArchive: true
      }
    }
    stage(' unit tesst and jacoco') {
      steps{
        sh 'mvn test'
      }
      post {
        always {
          junit 'target/surefire-reports/*.xml'
          jacoco execPattern: 'target/jacoco.exec'
        }
      }
    }
    stage ('docker build stage' ) {
      steps {
        docker.withRegistry(DOCKER_REGISTRY, DOCKER_CREDENTIALS_ID) {
          sh 'docker build -t akhilyechuri064/devops:""$GIT_COMMIT"" .'
          sh 'docker push akhilyechuri064/devops:""$GIT_COMMIT""'
        }
      }
    }
  }
}
