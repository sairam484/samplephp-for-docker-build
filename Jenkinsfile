pipeline {
	agent any
	tools {
		maven 'maven3.8.2'
	}
	stages {
		stage ("checkout") {
		        steps {
			            checkout([$class: 'GitSCM', 
			            branches: [[name: '*/master']], 
			            extensions: [], 
			            userRemoteConfigs: [[url: 'https://github.com/keyspaceits/javawebapp.git']]])
			}
		}
		stage ("build") {
			steps {
			sh 'mvn clean install -f pom.xml'
			}

		}
		stage ("Deploy") {
			steps {
				deploy adapters: [tomcat9(credentialsId: 'deployer', 
				path: '', url: 'http://3.90.185.23:8080')], 
				contextPath: null, 
				war: '**/*.war'
				}

			}
		}
	}
