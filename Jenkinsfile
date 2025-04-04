 pipeline {
     agent any 
     stages {
         stage('Build Artifact - Maven') {
             steps {
             sh "mvn clean package -DskipTests=true" // checkings
             archive 'target/*.jar'    
             }
         }
      stage('test stage') {
             steps {
             sh "mvn test" 
             }
      }
      stage( 'docker stage') {
       steps {
          docker.withRegistry(url: "", registryCredentialsId: "docker-hub") {
            sh 'docker build -t akhilyechuri064/devops:""$GIT_COMMIT"" .'
            sh 'docker push akhilyechuri064/devops:""$GIT_COMMIT""'
          }
       }
 }
 }
 }
