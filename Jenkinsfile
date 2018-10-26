pipeline {
  agent any
  stages {
    stage('Code Analysis') {
      steps {
        echo "starting code analysis..."
        ws('/project') {
          sh './gradlew sonarqube'
        }
      }
    }
  }
}