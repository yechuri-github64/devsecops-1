pipeline {
  agent any 
  stages {
    stage(' build artifact ') {
      steps{
        sh 'mvn clean package -DskipTests=true'
        archiveArtifacts artifacts: 'target/*.jar', allowEmptyArchive: true
      }
    }
  }
}
