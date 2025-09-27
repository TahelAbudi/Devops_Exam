pipeline {
    agent any
    
    parameters {
        string(name: 'NAME', defaultValue: 'World', description: 'Name parameter')
    }
    
    stages {
        stage('Node Info') {
            steps {
                echo "Node: ${env.NODE_NAME}"
                script {
                    if (isUnix()) {
                        sh 'uname -a'
                    }
                }
            }
        }
        
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Run Script') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'chmod +x scripts/hello.sh'
                        sh './scripts/hello.sh '${params.NAME}' > output.txt'
                    } else {
                        bat 'bash scripts/hello.sh "${params.NAME}" > output.txt'
                    }
                }
            }
        }
        
        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'output.txt', fingerprint: true
            }
        }
    }
}