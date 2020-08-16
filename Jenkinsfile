pipeline {
    agent any

    tools {
        maven 'Maven_3.6.3_1'
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
                sh 'mvn package'
            }
        }

        /* stage ('Deployment Stage') {
            steps {
                sh 'mvn deploy'
            }
        } */
    }
}
