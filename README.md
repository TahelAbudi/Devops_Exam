# DevOps Exam Project

# Running Jenkins
Used this command to start Jenkins:
```
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

The volume `jenkins_home` keeps all Jenkins data when container restarts.

# Setup
- Got initial password with: `docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword`  
- Installed suggested plugins
- Created admin user via web interface

# Files
- `Jenkinsfile` - pipeline config
- `scripts/hello.sh` - bash script that prints date + git info
- `README.md` - this file
- `.gitignore` - standard git ignore

# How it works
Pipeline takes a NAME parameter (default "World"), runs the hello script, and saves output to artifact.

The script uses `set -euo pipefail` for error handling as required.

# Questions and Answers
1. If you kill the Jenkins container, what command do you use to start it again with the same configuration?
   `docker start jenkins` - use docker start with the container name. All the settings stay because we gave it a name and used a volume
2. Explain briefly why Jenkins preserves its state after restart?
   The volume jenkins_home saves everything to the computer, not just in the container. 
   So when Jenkins starts again it finds all the old data still there.
   
# Files Description
- Jenkinsfile: Defines the Jenkins pipeline with stages for checkout, script execution, and archiving
- scripts/hello.sh: Bash script that prints date, Git SHA, and greeting message
- README.md: Project documentation
- .gitignore: Excludes temporary and build files from Git

# Requirements
- Jenkins with Pipeline plugin
- Bash environment
- Git integration