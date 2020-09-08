#!/usr/bin/env groovy

def getOSFamily(){
    def osFamily = params.OS.split(':') 
    return osFamily[0]
}

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
        choice choices: ['ubuntu:18.04', 'centos:7.8.2003'], description: '', name: 'OS'
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
                script {
                    def osFamily = getOSFamily 
                    def dockFile = "${osFamily}.Dockerfile"
                    def tag = "b${env.BUILD_NUMBER}-${params.OS}"
                    dockerBuild project: 'library', repo: 'cpp', tags: [tag], push: false
                }
            }           
        }        
    }
}