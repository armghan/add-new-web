# add-new-web
This script is intended to deploy a new web container in existing docker-compose container orchestrator.
To add a new web you have to pass 2 arguments with bash script
1. Domain Name(URL)
2. Container Name 

you can execute this script as 
./add-new-app.bash site3 'geerlingguy/kube101:hello-go'

Prerequisites
1.Docker runtime
2.Docker Compose