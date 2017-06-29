#!groovy
 
agent any

stages {
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
