pipeline {
    agent any

    tools {
        maven 'Maven_3.6.3_1'
    }

     environment {
	 // holds reference to docker image
	 DOCKER_IMAGE = readMavenPom().getArtifactId()
	 DOCKER_IMAGE_VERSION = readMavenPom().getVersion()
	 DOCKER_IMAGE_TAG = "${DOCKER_IMAGE}${env.BUILD_NUMBER}"
    }

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
             steps {
                //echo "Docker Image Tag Name: ${DOCKER_IMAGE_TAG}"

                sh "docker stop ${DOCKER_IMAGE}"

                sh "docker rm ${DOCKER_IMAGE}"

                sh "docker run --name ${DOCKER_IMAGE} -d -p 2222:2222 ${DOCKER_IMAGE}:${env.BUILD_NUMBER}"

              // docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
              //    dockerImage.push("${env.BUILD_NUMBER}")
              //      dockerImage.push("latest")
              //  }
              }
        }
    }
}
