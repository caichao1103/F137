#!/usr/bin/env groovy

pipeline {
    agent {
        label 'os:linux'
    }
    options {
        skipDefaultCheckout()
        disableConcurrentBuilds()
        buildDiscarder(logRotator(
            daysToKeepStr: '15',
            artifactNumToKeepStr: '20'
        ))
        ansiColor('xterm')
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    SCM_VARS = checkout scm
                    println SCM_VARS
                }
            }
        }
    }
}