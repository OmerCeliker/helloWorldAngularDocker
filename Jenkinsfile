pipeline {
  agent any
  stages {
    
     stage('PrintEnvVariables') {
      agent any
      steps {
        sh 'echo  $WORKSPACE'
      }
    }
    
    
    stage('Build') {
      steps {
        sh ' we have no build action '
      }
    }
    
    
        stage('Analysis') {
      parallel {
        stage('Security') {
          steps {
            sh 'echo running Security'
          }
        }
        stage('Code Quality') {
          steps {
            sh 'echo running Code Quality'
          }
        }
      }
    }
    stage('Tests') {
      parallel {
        stage('IntegrationTest') {
          steps {
            sh 'echo running Integration Test'
          }
        }
        stage('SmokeTest') {
          steps {
            sh 'echo smokeTest'
          }
        }
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
