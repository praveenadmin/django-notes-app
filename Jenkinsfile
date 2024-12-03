@Library('shared') _
pipeline {
    agent { label 'praveen' }

    stages {
        stage("Hello") {
            steps {
                script {
                    hello()
                }
            }
        }
        stage("Code") {
            steps {
                script {
                    gitcheck("https://github.com/praveenadmin/django-notes-app.git", "main")
                }
            }
        }
        stage("Build") {
            steps {
                script {
                    dockerbuild("notes-app", "praveenadmin", "latest")
                }
            }
        }
        stage("Running") {
            steps {
                echo "This is running the code"
                sh "docker run -d -p 8005:8005 praveenadmin/notes-app:latest"
            }
        }
        stage("Deploy") {
            steps {
                echo "Deploy stage"
            }
        }
    }
}
