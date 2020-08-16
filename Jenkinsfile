pipeline {
    agent any

    tools {
        maven 'Maven_3.6.3_1'
    }

    stages {
	
        stage ('Compile Stage') {

            steps {
                bat "mvn clean compile"
            }
        }

        stage ('Testing Stage') {

            steps {
                bat "mvn test"
            }
        }

        stage ('Building Stage') {

            steps {
                bat "mvn package"
            }
        }

        stage ('Deployment Stage') {
            steps {
                bat "mvn deploy"
            }
        }
    }
}
