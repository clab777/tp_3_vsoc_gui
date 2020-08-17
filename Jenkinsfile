node {

    environment {
	    // holds reference to docker image
	    IMAGE = readMavenPom().getArtifactId()
	    IMAGE_VERSION = readMavenPom().getVersion()
	    IMAGE_TAG = "${env.BUILD_NUMBER}"
    }
    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'JenkinsDockerCredentials') {

        def customImage = docker.build("ctraore/${IMAGE}-v${IMAGE_VERSION}:${IMAGE_TAG}")

        echo "customImage: ${customImage}"

        /* Push the container to the custom Registry */
        customImage.push()
    }
}