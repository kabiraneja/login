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
                sh ' scp -i id_rsa /var/jenkins_home/workspace/spring-mvn-pipeline/target/demo-1-build.jar root@43.204.215.78:~/'
                sh ' scp -i id_rsa /var/jenkins_home/workspace/spring-mvn-pipeline/Dockerfile root@43.204.215.78:~/'
                
                // SSH into the EC2 instance and deploy the .jar in Docker
                sh "ssh root@43.204.215.78 'docker stop demo-1 || true'"
                sh "ssh root@43.204.215.78 'docker rm demo-1 || true'"
                sh "ssh root@43.204.215.78 'docker build -t demo-1-build .'"
                sh "ssh root@43.204.215.78 'docker run -it -d -p 9090:9090 --name demo-1 demo-1-build'"
            }
        }
    }
}
