pipeline {
    agent any
    tools{
        maven 'maven_3_8_6'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/AnthonyCavanagh/springboot-k8s-ingress-rest']]])
                bat 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    bat 'docker build -t tonycav/k8:springboot-k8s-ingress-rest .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')])  {
                     bat 'docker login -u tonycav -p ${dockerhubpwd}'
                     bat 'docker push tonycav/k8:springboot-k8s-ingress-rest'
                   }
                }
            }
        }
        stage ("Kube Deploy") {
            steps {
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'K8S', namespace: '', serverUrl: '') {
                 bat "kubectl apply -f rest-deploy-service.yml"
                 bat "kubectl apply -f ingress.yaml"
                }
            }
        }
    }
}