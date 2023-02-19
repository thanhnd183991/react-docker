pipeline {
    agent any

    environment {     
        DOCKERHUB_CREDENTIALS= credentials('dockerhubcredentials')     
        PASSWORD_CLIENT= 123456a@
    } 

    stages {
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Build') {
            steps {
                sh 'echo $PASSWORD_CLIENT | sudo docker build -t ducthanh/react-docker:$BUILD_NUMBER . --password-stdin'     
	            echo 'Build Image Completed' 
            }
        }

        stage('Login to Docker Hub') {         
            steps{                            
	            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
	            echo 'Login Completed'                
            }           
        }               
        stage('Push Image to Docker Hub') {         
            steps{                            
	            sh 'docker push ducthanh/react-docker:$BUILD_NUMBER'
                echo 'Push Image Completed'       
            }           
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }// END STAGES

    post{
        always {  
            sh 'docker logout'           
        }      
    }  
}