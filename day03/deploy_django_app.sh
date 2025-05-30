#!/bin/bash

<< task
Deploy a Django app
and handle the code for errors
task

code_clone(){
	echo "Cloning the Django app.."
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirements(){
	echo "Installing dependencies"
	sudo apt-get install docker.io nginx -y docker-compose
}

required_restarts(){
	sudo chown $USER /var/run/docker.sock
	sudo chown -R $USER:$USER /home/ubuntu/shell-scripting-for-devops/day03/django-notes-app
	#sudo systemctl enable docker
	#sudo systemctl enable nginx
	#sudo systemctl restart docker
}

deploy(){
	docker build -t notes-app .
	#docker run -d -p 8000:8000 notes-app:latest
	docker-compose up -d
}

echo "****** Deployement Started *********"
if ! code_clone; then
	echo "The code directory already exists"
	cd django-notes-app
fi

if ! install_requirements; then
	echo "Installation failed"
	exit 1
fi

if ! required_restarts; then
	echo "System fault identified"
	exit 1
fi

if ! deploy; then
	echo "Deployment failed, mail the admin"
	#send mail
	exit 1
fi

echo "***** Deployement done ********"
