
pipeline{
    agent any


    environment{
        DOCKERHUB_USERNAME = "zeemlinux"
        APP_NAME = "minyx"
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_NAME = "${DOCKERHUB_USERNAME}" + "/" + "${APP_NAME}"
        REGISTRY_CREDS = 'dockertoken'
        SONAR_LOGIN = credentials('sonartoken')
    }

    stages{
        stage('Checkout Workspace'){
            steps{
                script{
                    cleanWs()

                }
            }
        }
        stage(' Checkout Code From SCM'){
            steps{
                script{
                    git credentialsId: 'githubtoken',
                    url: 'https://github.com/zeemshomelab/resume.git',
                    branch: 'minyx'
                }
            }
        }
        stage('Docker Check Version'){
            steps{
        
                 sh 'docker --version'  
                 sh 'docker-compose version' 
                    
                }
            }
            stage('Build Docker Image'){
            steps{
        
                 sh 'docker-compose build --build-arg RESUME=mshade.yaml'

                    
                }
            }
        }
    }