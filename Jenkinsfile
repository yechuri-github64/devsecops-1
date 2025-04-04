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
             post {
              always {
               junit 'target/surefire-reports/*.xml'
               jacoco execPattern: 'target/jacoco.exec'
              }
            }
      }
    }
 }
