pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Asset'
        STUDENT_SURNAME = 'Kainaddinov'
        STUDENT_GROUP   = 'IT2-2306'
        STUDENT_ID      = '37428'
        IMAGE_NAME      = 'kainaddinov-asset-devops'
        CONTAINER_NAME  = 'kainaddinov-asset-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'git log -1 --oneline'
            }
        }

        stage('Build') {
            steps {
                sh '''
                    chmod +x scripts/Kainaddinov_Asset_system.sh
                    bash -n scripts/Kainaddinov_Asset_system.sh
                    ls -la
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    test -f Dockerfile
                    test -f app/app.py
                    test -f Kainaddinov_Asset_info.txt
                    ./scripts/Kainaddinov_Asset_system.sh
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
                sh 'docker images $IMAGE_NAME'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    docker rm -f $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME \
                        -e STUDENT_NAME=$STUDENT_NAME \
                        -e STUDENT_SURNAME=$STUDENT_SURNAME \
                        -e STUDENT_GROUP=$STUDENT_GROUP \
                        -e STUDENT_ID=$STUDENT_ID \
                        -p 8081:8080 \
                        $IMAGE_NAME
                    sleep 3
                    docker ps --filter name=$CONTAINER_NAME
                    docker logs $CONTAINER_NAME
                '''
            }
        }
    }
}
