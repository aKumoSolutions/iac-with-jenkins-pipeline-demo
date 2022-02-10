def app_url
def app_pub_ip
pipeline {
    agent any
    options {
        ansiColor('xterm')
    }
    parameters {
    choice(name: 'TF_ACTION', 
        choices: ['apply', 'destroy'], 
        description: 'Pick something')
    }
    // Stages
    stages {
        stage("Terraform Init") {
            steps {
                echo "Running Terraform Init"
                sh "terraform init"
            }
        }
        stage("Terraform Validate") {
            steps {
                echo "Running Terraform Init"
                sh "terraform validate"
            }
        }
        stage("Terraform Plan") {
            steps {
                echo "Running Terraform Plan"
                sh "terraform plan"
            }
        }
        stage("Terraform Action") {
            steps {
                echo "Running Terraform ${params.TF_ACTION}"
                sh "terraform ${params.TF_ACTION} --auto-approve"
                script {
                    app_url = sh(returnStdout: true, script: "terraform output test_ec_aws_route53_record").trim()
                    app_pub_ip = sh(returnStdout: true, script: "terraform output test_ec_pub_ip").trim()
                }
            }
        }
    }

    // Post Actions
    post('Clean Workspae') {
        always {
            echo '### CLEANING WORKSPACE ###'
            cleanWs()
            updateGitlabCommitStatus name: 'build', state: 'pending'
            updateGitlabCommitStatus name: 'build', state: 'success'
        }
        success {
            withCredentials([string(credentialsId: 'office365ConnectorSend_Url', variable: 'MS365_URL')]) {
            office365ConnectorSend webhookUrl: "$MS365_URL",
                factDefinitions: [[name: "Build Number", template: env.BUILD_NUMBER],
                                  [name: "Build URL"   , template: env.BUILD_URL   ],
                                  [name: "Git URL"     , template: env.GIT_URL     ],
                                  [name: "App URL"     , template: "${app_url}"    ],
                                  [name: "App Public IP", template: "${app_pub_ip}"]]
            }   
        }
    }
}