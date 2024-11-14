// shared lib
pipeline {
    agent {
        label 'k8s-slave'
    }
    parameters {
        choice(name: 'dockerPush',
            choices: 'no\nyes',
            description: 'This Will build dockerImage and Push'
        )

    }

    environment {
        APPLICATION_NAME = "clothing" 
        DOCKER_HUB = "docker.io/i27devopsb4"
        DOCKER_CREDS = credentials('dockerhub_creds') //username and password
    }
    stages {
        stage ('Docker Build and Push') {
            when {
                anyOf {
                    expression {
                        params.dockerPush == 'yes'
                    }
                }
            }
            steps { 
                script {
                    dockerBuildAndPush().call()
                }
            } 
        }
        // stage ("DeploytoDev") {
        //     steps {
        //         script {
        //             k8sdeploy //
        //         }
        //     }
        // }
        // stage("Deploytostage")
        // {
        //     steps {
        //         script {
        //             k8sdeploy //
        //         }
        //     }
        // }
        // stage("DeploytoProd")
        // {
        //     steps {
        //         script {
        //             k8sdeploy //
        //         }
        //     }
        // }
    }
}

// Method for Docker build and Push
def dockerBuildAndPush(){
    return {
        echo "************************* Building Docker image*************************"
        sh "cp ${WORKSPACE}/target/i27-${env.APPLICATION_NAME}-${env.POM_VERSION}.${env.POM_PACKAGING} ./.cicd"
        sh "docker build --no-cache --build-arg JAR_SOURCE=i27-${env.APPLICATION_NAME}-${env.POM_VERSION}.${env.POM_PACKAGING} -t ${env.DOCKER_HUB}/${env.APPLICATION_NAME}:${GIT_COMMIT} ./.cicd"
        echo "************************ Login to Docker Registry ************************"
        sh "docker login -u ${DOCKER_CREDS_USR} -p ${DOCKER_CREDS_PSW}"
        sh "docker push ${env.DOCKER_HUB}/${env.APPLICATION_NAME}:${GIT_COMMIT}"
    }
}