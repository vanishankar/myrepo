pipeline {
    agent any
 stages {
  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t tomcat .' 
                  sh 'docker tag tomcat vanishankar/tomcat'
                sh 'docker tag tomcat  vanishankar/tomcat:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push vanishankar/tomcat'
          sh  'docker push  vanishankar/tomcat:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps {
                sh "docker run -d -p 8089:8080 vanishankar/tomcat"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://dockeradmin@172.31.22.209 run -d -p 8089:8080  vanishankar/tomcat"
 
            }
        }
    }
}
