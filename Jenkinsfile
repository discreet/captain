#!groovy

node() {
  stage('Checkout') {
    deleteDir()
    checkout scm
  }

  stage('rubocop') {
    sh'''
      rubocop
    '''
  }
}
