pipeline {
    agent any
    stages {
	
        stage ('Compile Stage') {

            steps {
                withMaven(maven : 'maven_3.6.3_1') {
                    sh 'mvn clean compile'
                }
            }
        }

        stage ('Testing Stage') {

            steps {
                withMaven(maven : 'maven_3.6.3_1') {
                    sh 'mvn test'
                }
            }
        }

        stage ('Building Stage') {

            steps {
                withMaven(maven : 'maven_3.6.3_1') {
                    sh 'mvn package'
                }
            }
        }

        stage ('Deployment Stage') {
            steps {
                withMaven(maven : 'maven_3.6.3_1') {
                    sh 'mvn deploy'
                }
            }
        }
    }
}
