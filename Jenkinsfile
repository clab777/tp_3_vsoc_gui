node{
   stage('SCM Checkout'){
       git credentialsId: 'JenkinsUser', url: 'https://github.com/clab777/tp_3_vsoc_gui/'
   }
   stage('Mvn Package'){
     def mvnHome = tool name: 'maven-3', type: 'maven'
     def mvnCMD = "${mvnHome}/bin/mvn"
     sh "${mvnCMD} clean package"
   }
  
}
