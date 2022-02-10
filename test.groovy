stage ('Invoke_job2') {
            steps {
                build job: 'iac-with-jenkins-pipeline-job2'
            }
        }