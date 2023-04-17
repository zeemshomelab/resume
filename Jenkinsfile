
pipeline{
    agent any


    environment{
        DOCKERHUB_USERNAME = "zeemlinux"
        APP_NAME = "${JOB_NAME}"
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
        
                 sh 'docker-compose build --build-arg RESUME=ade.yaml --no-cache'
                 
                //  docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
                 sh 'docker tag minyx-resume_resume:latest zeemlinux/minyx:latest'
                //  sh 'docker rmi minyx-resume_resume:latest'
                //  sh 'docker images -a | grep "none" | awk '{print $3}' | xargs docker rmi'
                }
        }
        stage('Push Docker Image'){
            steps{
                script{
                    docker.withRegistry('',REGISTRY_CREDS){
                      sh 'docker push zeemlinux/minyx:latest' 
                    }
                }
            }
        }
        stage('Delete Docker Images'){
            steps{
                script{
                    sh 'docker rmi minyx-resume_resume:latest'
                }
            }
        }
         stage('Updating Kubernetes Deployment File'){
            steps{
                script{
                    sh """
                    cat deployment.yml
                    sed -i 's/${APP_NAME}.*/${APP_NAME}:${IMAGE_TAG}/g' deployment.yml
                    cat deployment.yml

                    """
                }
            }
        }
        stage(' Push the Changed Deployment File Git '){
            steps{
                script{
                    sh """
                     git config --global user.name "zeemshomelab"
                     git config --global user.email zeems.homelab@gmail.com
                     git add deployment.yml
                     git commit -m "updated deployment.yml file"
                    """
                    withCredentials([gitUsernamePassword(credentialsId: 'githubtoken', gitToolName: 'Default')]) {

                     sh "git pushhttps://github.com/zeemshomelab/resume.git minyx"

                   }
                   
                }
            }
       }
            
    }
}