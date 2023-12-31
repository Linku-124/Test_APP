pipeline {
    agent any

    stages {
        stage('Select Branch') {
            steps {
                script {
                    // Use 'git ls-remote' to dynamically fetch branch names from the remote repository
                    def branchList = sh(script: "git ls-remote --heads origin | awk -F'/' '{print \$3}'", returnStdout: true).trim().split('\n')

                    def userInput = input(
                        id: 'branchInput',
                        message: 'Select the branch to build:',
                        parameters: [choice(name: 'BRANCH_NAME', choices: branchList.join('\n'), description: 'Select a branch to build')]
                    )
                    echo "Selected branch: ${userInput}"
                }
            }
        }

        stage('Checkout and Build') {
            steps {
                script {
                    def selectedBranch = env.BRANCH_NAME
                    checkout([$class: 'GitSCM', branches: [[name: selectedBranch]], doGenerateSubmoduleConfigurations: false, extensions: []])
                    sh "your-build-command-here"  // Replace with your build command
                }
            }
        }
    }

    post {
        success {
            echo "Build succeeded!"
        }
        failure {
            echo "Build failed!"
        }
    }
}
