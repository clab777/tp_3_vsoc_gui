pipeline {
    agent any
    /*
    tools {
        maven 'Maven_3.6.3_1'
    }
    */

    // ** NOTE: This 'maven-3.5.2' Maven tool must be configured in the Jenkins Global Configuration.
	 def mvnHome = tool 'Maven_3.6.3_1'


	 // holds reference to docker image
	 def dockerImage
	 // ip address of the docker private repository(nexus)

	 def dockerImageTag = "vsoc-jdi${env.BUILD_NUMBER}"


    stages {
	
        stage ('Compile Stage') {

            steps {
                sh 'mvn clean compile'
            }
        }

        stage ('Testing Stage') {

            steps {
                sh 'mvn test'
            }
        }

        stage ('Building Stage') {

            steps {
                sh 'mvn install'
            }
        }

        /* stage ('Deployment Stage') {
            steps {
                sh 'mvn deploy'
            }
        } */

        stage('Deploy Docker Image') {
            // deploy docker image to nexus

            echo "Docker Image Tag Name: ${dockerImageTag}"

            sh "docker stop vsoc-jdi"

             sh "docker rm vsoc-jdi"

            sh "docker run --name vsoc-jdi -d -p 2222:2222 vsoc-jdi:${env.BUILD_NUMBER}"

          // docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
          //    dockerImage.push("${env.BUILD_NUMBER}")
          //      dockerImage.push("latest")
          //  }
        }
    }
}
