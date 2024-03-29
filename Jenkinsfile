pipeline{
        agent any
        environment{
            DATABASE_URI= credentials("DATABASE_URI")
            DOCKER_ID=credentials("DOCKER_ID")
            AZURE_ID=credentials("AZURE_ID")
        }
        stages{
            stage('Setup'){
                steps{
                    sh "bash scripts/setup.sh"
                }
            }
            stage('Test'){
                steps{
                    sh "bash scripts/test.sh"
                }
            }
            stage('Build'){
                steps{
                    sh "bash scripts/build.sh"
                }
            }
            stage('Config'){
                steps{
                    sh "bash scripts/config.sh"
                }
            }
            stage('Deploy'){
                steps{
                    sh "bash scripts/deploy.sh"
                }
            }
        }
        post {
            always {
            junit '**/*.xml'
            step([$class: 'CoberturaPublisher', autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: 'scripts/cobertura/coverage.xml', failUnhealthy: false, failUnstable: false, maxNumberOfBuilds: 0, onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false])
            step([$class: 'JacocoPublisher', autoUpdateHealth: false, autoUpdateStability: false, jacocoReportFile: 'backend/spring-petclinic-rest/target/site/jacoco/jacoco.xml', failUnhealthy: false, failUnstable: false, maxNumberOfBuilds: 0, onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false])

            }
        }
}