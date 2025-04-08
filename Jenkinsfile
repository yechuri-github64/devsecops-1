pipeline {
  agent any
  stages {
    stage ('Build stage' ) {
      steps {
        sh 'mvn clean package -DskipTests=true'
        archiveArtifacts artifacts: 'target/*.jar, allowEmptyArchive:true
      }
    }
  }
}
