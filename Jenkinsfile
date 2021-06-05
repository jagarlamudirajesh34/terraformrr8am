pipeline {
   agent any
   stages{
      stage('git pull'){
         steps{
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
            sh 'terraform apply --var-file=dev.tfvars'
          }
       }
   }

}
