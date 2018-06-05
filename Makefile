IMAGENAME=jpipeline
JENKINS_HOME_BACKUP_DIR?=/tmp/jenkins_home_backup
DOCKER_ARGS?=-v $(JENKINS_HOME_BACKUP_DIR):/var/jenkins_home \
			 -v /var/run/docker.sock:/var/run/docker.sock \
			 -p 8080:8080 \
			 -p 5000:5000

build:
	docker build -t $(IMAGENAME) .

run:
ifeq ("$(wildcard $(JENKINS_HOME_BACKUP_DIR))","")
	mkdir $(JENKINS_HOME_BACKUP_DIR)
endif
	docker run $(DOCKER_ARGS) $(IMAGENAME)
