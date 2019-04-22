pipeline {
    environment {
    registry = "sudheshpn/calculator"
    registryCredential = 'dockerhub'
    dockerImage = docker.build registry + ":$BUILD_NUMBER"
  }
     agent any
     stages {
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
                  docker.build registry + ":$BUILD_NUMBER"
                }
          }
        } 
         stage("Docker push") {
    	      steps {
                scripts {
                  docker.withRegistry( 'https://index.docker.io/v1', 'dockerhub' ) {
                    dockerImage.push()
                }
          }
}
     }
}
}
