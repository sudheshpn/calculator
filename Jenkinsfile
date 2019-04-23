pipeline {
    environment {
    registry = "sudheshpn/calculator"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
     agent any
     environment {
       PATH = "/usr/local/bin"
}
     stages {
          stage('PrintENV') {
               steps {
                    sh "printenv echo $PATH"
              }
           }
          stage("Compile") {
               steps {
                    sh "./gradlew compileJava"
               }
          }
          stage("Unit test") {
               steps {
                    sh "./gradlew test"
               }
          }
          stage("Code coverage") {
 		steps {
          	    sh "./gradlew jacocoTestReport"
                    publishHTML (target: [
                          reportDir: 'build/reports/jacoco/test/html',
     		          reportFiles: 'index.html',
               		  reportName: "JaCoCo Report"

		    ])	
                    sh "./gradlew jacocoTestCoverageVerification"
               }
          }
          stage("Check Style") {
               steps {
                    sh "./gradlew checkstyleMain"
               }
          }
 
         stage("Package") {
 	      steps {
                    sh "./gradlew build"
               }
	  }

         stage("Docker build") {
    	      steps {
                script {
                 dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
          }
        }
        stage("Deploy to staging") {
              steps {
                    echo "PATH is: $PATH"
                    sh "docker-compose up --build -d"
               }
        } 
         stage("Docker push") {
    	      steps {
                script {
                  docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                }
     }
}
}
}
