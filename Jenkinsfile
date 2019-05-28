pipeline {
  agent any
  stages {
    stage('Build') {
      
      steps {
        sh 'echo building '
      }
    }
    stage('TagBuild') {
      steps {
        sh 'echo tagging the build'
      }
    }
    stage('PushToDockerHub') {
      steps {
        sh 'echo pushing to docker hub'
      }
    }
    stage('PublishPortRunImage') {
      steps {
        sh 'echo publish port and run image'
      }
    }
  }
}
