pipeline {

    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/home/jenkins"
        // holds reference to docker image
        IMAGE = readMavenPom().getArtifactId()
        IMAGE_VERSION = readMavenPom().getVersion()
        IMAGE_TAG = "${env.BUILD_NUMBER}"
    }

    agent{
        dockerfile {
            label "docker"
            args "-v /tmp/maven:/home/jenkins/.m2 -e MAVEN_CONFIG=/home/jenkins/.m2"
        }
    }
     stages {
        stage ("Build") {
            steps {
                sh "ssh -V"
                sh "mvn -version"
                sh "mvn clean install"
            }
        }
     }

     post {
        always {
            cleanWs()
        }
     }
}