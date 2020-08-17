pipeline {

    agent{
        dockerfile{
            label "docker"
            args "-v /tmp/maven:/home/jenkins/.m2 -e MAVEN_CONFIG=/home/jenkins/.m2"
        }
    }
    environment {
	    // holds reference to docker image
	    IMAGE = readMavenPom().getArtifactId()
	    IMAGE_VERSION = readMavenPom().getVersion()
	    IMAGE_TAG = "${env.BUILD_NUMBER}"
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
                echo "Docker Image Tag Name: ${DOCKER_IMAGE_TAG}"

                sh "docker stop ${DOCKER_IMAGE}"

                sh "docker rm ${DOCKER_IMAGE}"

                sh "docker run --name ${DOCKER_IMAGE} -d -p 2222:2222 ${DOCKER_IMAGE}:${env.BUILD_NUMBER}"

              // docker.withRegistry('https://registry.hub.docker.com', 'JenkinsDockerCredentials') {
              //    dockerImage.push("${env.BUILD_NUMBER}")
              //      dockerImage.push("latest")
              //  }
              }
        }
    }
}