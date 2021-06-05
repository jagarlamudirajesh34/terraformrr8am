pipeline {
   agent any
   tools {
      git 'Default'
      jdk 'jdk1.8'
      maven 'maven3'
   }
   
   stages{
      stage('git pull'){
         steps{
            sh 'git --version'
            sh 'whereis git'
            git 'https://github.com/jagarlamudirajesh34/terraformrr8am.git'
          }
      }
      stage('terraform check'){
         steps{
           sh 'terraform --version'
         }
       }
       stage('terraform init'){
          steps{
            sh 'terraform init'
          }
       }
       stage('terraform apply'){
          steps{
            sh 'terraform destroy --var-file=dev.tfvars -auto-approve'
          }
       }
   }

}
