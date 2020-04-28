pipeline{
    agent any
    environment {
            DOCKER_IMAGE = "cjburchell/goci"
            DOCKER_TAG = "${env.BRANCH_NAME}"
			DOCKER_BUILDTAG = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
    }

    stages{
        stage('Setup') {
            steps {
                script{
                    slackSend color: "good", message: "Job: ${env.JOB_NAME} with build number ${env.BUILD_NUMBER} started"
                }
             /* Let's make sure we have the repository cloned to our workspace */
             checkout scm
             }
         }
		 
		 stage('Build') {
            steps {
                script {
                    def image = docker.build("${DOCKER_IMAGE}")
                    image.tag("${DOCKER_TAG}")
					image.tag("${DOCKER_BUILDTAG}")
                    if( env.BRANCH_NAME == "master") {
                        image.tag("latest")
                    }
                }
            }
        }

        stage ('Push') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub') {
                       def image = docker.image("${DOCKER_IMAGE}")
                       image.push("${DOCKER_TAG}")
					   image.push("${DOCKER_BUILDTAG}")
                       if( env.BRANCH_NAME == "master") {
                            image.push("latest")
                       }
                    }
                }
            }
        }
    }

    post {
        always {
              script{
	              sh "docker system prune -f || true"
				  sh "docker image prune -af || true"
	
                  if ( currentBuild.currentResult == "SUCCESS" ) {
                    slackSend color: "good", message: "Job: ${env.JOB_NAME} with build number ${env.BUILD_NUMBER} was successful"
                  }
                  else if( currentBuild.currentResult == "FAILURE" ) {
                    slackSend color: "danger", message: "Job: ${env.JOB_NAME} with build number ${env.BUILD_NUMBER} was failed"
                  }
                  else if( currentBuild.currentResult == "UNSTABLE" ) {
                    slackSend color: "warning", message: "Job: ${env.JOB_NAME} with build number ${env.BUILD_NUMBER} was unstable"
                  }
                  else {
                    slackSend color: "danger", message: "Job: ${env.JOB_NAME} with build number ${env.BUILD_NUMBER} its result (${currentBuild.currentResult}) was unclear"
                  }
              }
        }
    }

}