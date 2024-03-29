pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        // Checkout your source code from GitHub
        git 'https://github.com/Likhi-G1/RestaurantProject.git'

        // Build your Spring Boot application
        sh 'mvn clean install'
      }
    }

    stage('Test') {
      steps {
        // Run tests on your Spring Boot application
        sh 'mvn test'
      }
    }

    stage('Docker Build and Push') {
      steps {
        // Build the Docker image
        sh 'docker build --no-cache -t likhi1/restaurantproject:latest .'

        // Push the Docker image to Docker Hub
        sh 'docker login -u likhi1 -p Likhi@123'
        sh 'docker push likhi1/restaurantproject:latest'
      }
    }

    stage('Deploy') {
      environment {
        CONTAINER_NAME = 'restaurantproject'
        
      }
      steps {
        // Set up Kubernetes context using kubeconfig
        withKubeConfig([credentialsId: 'k8sgroup']) {
          // Deploy the application to Kubernetes using the deployment YAML file
          sh 'kubectl apply -f application-deployment.yml'

          // Start the service
          sh 'kubectl apply -f application-service.yml'

          // Restart the deployment to apply the changes
          sh 'kubectl rollout restart deployment javapp'

          // Create a service to expose the application
          // sh 'kubectl expose deployment/${CONTAINER_NAME} --port=8081 --target-port=8081 --type=LoadBalancer --name=${CONTAINER_NAME}'
        }
      }
    }
  }
}
