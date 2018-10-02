#!/usr/bin/env bash
echo 'Deployment in progress'
pwd && cd target

if (( $(ps -ef | grep -v grep | grep grizzlystore-apigateway | wc -l) > 0)) 
	then
		echo "API Gateway is running...attempting to stop the service!"
		sudo systemctl stop grizzlystore-apigateway.service || true
fi

if [ -f grizzlystore-apigateway ] ; then
    sudo rm /etc/init.d/grizzlystore-apigateway || true
fi

cp *.jar /opt/GrizzlyStoreMicroServices/grizzlystore-apigateway.jar
sudo systemctl start grizzlystore-apigateway.service