pipeline {
  agent any
  stages {
    stage('Build') {
      agent {
        docker {
          image 'maven:3.6.1-jdk-8'
          args '-v  $WORKSPACE/.m2:/root/.m2 '
        }

      }
      steps {
        sh 'mvn  clean install '
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