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
               sh "docker build --build-arg BASE_IMAGE=${params.BASE_IMAGE} -t gcc:v1. && docker images"
            }           
        }        
        stage('Upload Image') {
            steps {
                script {
                    // def tag = dockerTagName()
                    // dockerBuild project: 'library', repo: 'dynamodb-mysql', tags: [tag], push: true
                }
            }
        }
    }
}