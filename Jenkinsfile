#!groovy

node() {
  stage('Checkout Code') {
    deleteDir()
    checkout scm
  }

  stage('Pull Docker Image') {

    docker.withRegistry('https://dockyard.cloud.capitalone.com', 'mya561') {
      def imageFqdn = 'https://dockyard.cloud.capitalone.com/sse-poto/chris-reqs'
      def dockerImage = docker.image('sse-poto/chris-reqs')
      dockerImage.pull()
      docker.script.sh(script: "docker run -d --name chris-reqs $imageFqdn tail -f /dev/null", returnStdout: true).trim()
    }
  }

  //stage('rubocop') {
  //  sh'''
  //    rubocop
  //  '''
  //}
}
