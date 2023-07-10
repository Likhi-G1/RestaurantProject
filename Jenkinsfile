pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        // Checkout your source code from GitHub
        git 'https://github.com/Likhi-G1/RestaurantProject.git'

        // Build your Spring Boot application
        sh 'mvn clean'
        sh 'mvn install'
      }
    }

    stage('Test') {
      steps {
        // Run tests on your Spring Boot application
        sh 'mvn test'
      }
    }

    stage('Deploy') {
      environment {
        CONTAINER_NAME = 'restaurantproject'
      }
      steps {
        // Stop and remove the existing EcomApp container if it is running
        sh 'docker stop ${CONTAINER_NAME} || true'
        sh 'docker rm ${CONTAINER_NAME} || true'

        // Delete the EcomApp image if it exists
        sh 'docker rmi ${CONTAINER_NAME} || true'

        // Build the Docker image
        sh 'docker build --no-cache -t likhi1/restaurantproject:latest .'

        // rUN THE DOKCER IMAGE
        sh 'docker run -d -p 8081:8081 likhi1/restaurantproject'
        
        // Push the Docker image to Docker Hub
       // sh 'docker login -u likhi1 -p Likhi@123'
        // sh 'docker push likhi1/restaurantproject:latest'
      }
    }
  }
}
