#!groovy

node() {
  stage('Checkout Code') {
    deleteDir()
    checkout scm
  }

  stage('Pull Docker Image') {
    def dockyardUrl = 'https://dockyard.cloud.capitalone.com'
    def imageID = 'sse-poto/chris-reqs'
    def imageFdn = dockyardUrl + "/" + imageId

    docker.withRegistry(dockyardUrl, 'mya561') {
      def dockerImage = docker.image(imageID)
      dockerImage.pull()
      docker.script.sh(script: "docker run -d --name chris-reqs $imageFdn tail -f /dev/null", returnStdout: true).trim()
    }
  }

  //stage('rubocop') {
  //  sh'''
  //    rubocop
  //  '''
  //}
}
