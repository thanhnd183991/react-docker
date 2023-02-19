pipeline {
    agent any

    environment {     
        DOCKERHUB_CREDENTIALS= credentials('dockerhubcredentials')     
    } 

    stages {
        stage('Test') {
            steps {
                
                echo 'Testing..'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t ducthanh/react-docker:$BUILD_NUMBER .'     
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