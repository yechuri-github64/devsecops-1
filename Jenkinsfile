pipeline {
  agent any
  stages {
    stage ('Build stage' ) {
      steps {
        sh 'mvn clean package -DskipTests=true'
        archiveArtifacts artifacts:'target/*.jar, allowEmptyArchive:true'
      }
    }
    stage ('test stage' ) {
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
    stage ('docker build amd push' ) {
      steps {
        withDockerRegistry([credentialsId: "dockercred", url: ""]) {
          sh 'docker build -t akhilyechuri064/devops:"${GIT_COMMIT}" .'
          sh 'docker push akhilyechuri064/devops:"${GIT_COMMIT}"'
        }
      }
    }
}
}
