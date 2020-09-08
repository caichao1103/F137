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
                    def osFamily = getOSFamily() 
                    def dockerFile = "${osFamily}.Dockerfile"
                    println dockerFile
                    def osInfo = params.OS.replaceAll(":","-")
                    def tag = "b${env.BUILD_NUMBER}-${osInfo}"
                    print tag
                    dockerBuild project: 'library', repo: 'cpp', tags: [tag], buildarg: "BASE_IMAGE=ubuntu:18.04", dockerfile: dockerFile, push: false
                }
            }           
        }        
    }
}