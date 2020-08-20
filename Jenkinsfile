node {
    def app
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/var/maven"
        JAVA_TOOL_OPTIONS = "-Duser.home=/home/jenkins"
        // holds reference to docker image
	DOCKER_USER = "ctraore"
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
<<<<<<< HEAD
        docker.withRegistry('https://registry.hub.docker.com', 'jenkinsDockerCredentials') {
            app.push("latest")
=======
        //docker.withRegistry('https://registry.hub.docker.com', 'jenkinsDockerCredentials') {
	    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
		sh "docker login -u ctraore -p ${dockerHubPwd} "
		    
            	app.push("latest")
>>>>>>> 382e4c6402486f31017a0f81e03ead6086277f9c
	}
	echo "Trying to Push Docker Build to DockerHub"
    }
}
