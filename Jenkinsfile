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
  stage('Mutation Tests - PIT') {
    steps {
      sh "mvn org.pitest:pitest-maven:mutationCoverage"
      }
    post {
      always {
        pitmutation mutationStatsFile: '**/target/pit-reports/**/mutations.xml'
     }
    }
  }
    stage('SonarQube - SAST') {
      steps { 
        sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=devsecops -Dsonar.projectName='devsecops' -Dsonar.host.url=http://localhost:9000 -Dsonar.token=sqp_ccd948bffca8dbafe095b021db6d79ebabe65dbf'
      }
    }
    stage ('docker build amd push' ) {
      steps {
        withDockerRegistry([credentialsId: "dockercred", url: ""]) {
          sh 'docker build -t akhilyechuri064/devops:"${GIT_COMMIT}" .'
          sh 'docker push akhilyechuri064/devops:"${GIT_COMMIT}"'
          sh 'docker run -d -p 4499:4499 akhilyechuri064/devops:"${GIT_COMMIT}"'
        }
      }
    }
}
}
