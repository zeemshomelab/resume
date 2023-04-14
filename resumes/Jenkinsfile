
pipeline{
    agent any

    stages{
        stage('Checkout Workspace'){
            steps{
                script{
                    cleanWs

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

    }
}