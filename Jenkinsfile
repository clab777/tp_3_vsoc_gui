node {
    def app
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/var/maven"
        JAVA_TOOL_OPTIONS = "-Duser.home=/home/jenkins"
        // holds reference to docker image
        IMAGE = readMavenPom().getArtifactId()
        IMAGE_VERSION = readMavenPom().getVersion()
        IMAGE_TAG = "${env.BUILD_NUMBER}"
    }
	
    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("ctraore/vsoc-jdi")
    }

    stage('Test image') {
        
        app.inside {
            echo "Tests passed"
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'jenkinsDockerCredentials') {
            app.push("${env.BUILD_NUMBER}:latest")
	}
	echo "Trying to Push Docker Build to DockerHub"
    }
}
