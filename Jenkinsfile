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
                sh 'docker build -t ducthanh/react-docker:$BUILD_NUMBER -t ducthanh/react-docker:latest .'     
	            echo 'Build Image Completed' 
            }
        }

        stage('Login to Docker Hub') {         
            steps{                            
	            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
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
                sh "ssh -oStrictHostKeyChecking=no ec2-user@ec2-13-115-35-162.ap-northeast-1.compute.amazonaws.com -i='/home/thanh/Documents/aws/keypair/aws-ec2-server1.pem' && ./deploy.sh"
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