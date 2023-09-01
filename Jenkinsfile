pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from the repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Build the Spring Boot application using Maven
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Deploy to Docker') {
            steps {
                // Copy the built .jar file to the EC2 instance
                sh ' scp -i id_rsa /var/jenkins_home/workspace/spring-mvn-pipeline/target/login.jar root@3.109.124.8:~/'
                sh ' scp -i id_rsa /var/jenkins_home/workspace/spring-mvn-pipeline/Dockerfile root@3.109.124.8:~/'
                
                // SSH into the EC2 instance and deploy the .jar in Docker
                sh "ssh root@3.109.124.8 'docker stop demo-1 || true'"
                sh "ssh root@3.109.124.8 'docker rm demo-1 || true'"
                sh "ssh root@3.109.124.8 'docker build -t login .'"
                sh "ssh root@3.109.124.8 'docker run -it -d -p 9090:9090 --name login login'"
            }
        }
    }
}
