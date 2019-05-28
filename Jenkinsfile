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
        sh ' echo we have no build action '
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
        sh '''#clean prune 
docker system prune --all --force --volumes
cd /var/lib/jenkins/workspace/helloWorldAngularDocker_master@2
docker build -t ocel12356/my-nodejs-app . '''
      }
    }
    stage('PushToDockerHub') {
      steps {
        sh '''
cd /var/lib/jenkins/workspace/helloWorldAngularDocker_master@2
docker push ocel12356/my-nodejs-app '''
      }
    }
    stage('PublishPortRunImage') {
      steps {
        sh '''
         docker kill $( docker ps | grep 4200  | awk \'{print $1}\' ) || true
docker \\
run -v ${PWD}:/app -v /app/node_modules -p 4200:4200/tcp --rm  ocel12356/my-nodejs-app '''
      }
    }
  }
}