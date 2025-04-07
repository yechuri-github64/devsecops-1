pipeline {
  agent any 
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
          junit 'target/surefire-reports/*.xml
          jacoco execPattern: 'target/jacoco.exec'
        }
      }
    }
  }
}
