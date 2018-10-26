# android-automated-code-analysis
Docker sample for prepare docker image that can build android apps in Jenkins &amp; send to SonarQube for code analysis

----------
This is Simple Android Project that only add options for SonarQube to build.gradle and Docker related files.

## As [build.gradle](https://github.com/lordgift/android-automated-code-analysis/commit/e6599f5e7d82c27fb3da2b2e86ea4a0ab7e3efbb#diff-c197962302397baf3a4cc36463dce5ea)
SonarQube configured destination at http://sonar:9000 (unknown host)

## As [docker-compose.yml](./docker-compose.yml) 
Docker Compose configured to create 2 containers
1. Jenkins (localhost:8080)
2. SonarQube (localhost:9000 or sonar:9000)

+ Jenkins' container will automatic prepare ANDROID_SDK follow with [Dockerfile](./jenkins.Dockerfile) ***"YEAH!! It ready to build Android"***
+ Jenkins' container know http://sonar:9000 is http://157.179.1.1:9000 that is static IP configured

----------

You have to create Jenkins' pipeline project & configure only 1 from 2 following way.

- Pipeline script
```
node {
    stage('code analysis') {
        ws('/project') {
            sh './gradlew sonarqube'
        }
    }
}
```

- Pipeline script from SCM (Jenkinsfile)

Put SCM repository that must included [Jenkinsfile](./Jenkinsfile)

----------
 
Jenkins will uses /project which shared from host machine then execute gradle via jenkins job to send to SonarQube container. 