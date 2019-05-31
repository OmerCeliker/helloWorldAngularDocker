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
docker system prune --all --force --volumes || true
cd /var/lib/jenkins/workspace/helloWorldAngularDocker_master@2
docker build -t ocel12356/my-nodejs-app . '''
      }
    }
    stage('PushToDockerRepo') {
      steps {
        sh '''
cd /var/lib/jenkins/workspace/helloWorldAngularDocker_master@2
docker push ocel12356/my-nodejs-app '''
      }
    }
    stage('PublishService') {
      steps {
        sh '''
         java -jar $JENKINS_HOME/sshclient-1.0.0.jar          -d tsangular -u ubuntu          -s ec2-13-59-153-143.us-east-2.compute.amazonaws.com            -i $JENKINS_HOME/ohio.pem -r 1 -m ocel12356/my-nodejs-app -p 4200

'''
      }
    }
  }
}