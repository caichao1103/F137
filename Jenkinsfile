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
    parameters {
        choice choices: ['ubuntu:18.04', 'centos:centos7.8.2003'], description: '', name: 'OS'
    }    
    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }
        stage('build') {
            steps {
               sh '''
                    BASE_IMAGE=${params.OS}
                    OSFamily=${BASE_IMAGE%:*}
                    docker build --build-arg BASE_IMAGE=${BASE_IMAGE} -t gcc-${OSFamily}:${env.BUILD_NUMBER} . && docker images"
                '''
            }           
        }        
    }
}