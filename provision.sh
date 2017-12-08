#!/bin/bash

echo "Beginning Provisioning Run"
date

if [ -n "$(which java | grep /usr/bin/java)" ]
then
	echo "Found Java.."
	echo "$(java -version)"
else
	echo "Installing Java.."
	tar -xf ~/petclinic/usbstick/jdk-7u80-linux-x64.tar.gz -C ~/petclinic/usbstick
	ln -sf ~/petclinic/usbstick/jdk1.7.0_80/bin/java /usr/bin/java
fi

if [ -n "$(grep "JAVA_HOME" /etc/bash.bashrc)" ]
then
	echo "JAVA_HOME found in /etc/bash.bashrc"
else
	echo "Adding JAVA_HOME to /etc/bash.bashrc.."
	echo "export JAVA_HOME=~/petclinic/usbstick/jdk1.7.0_80" >> /etc/bash.bashrc
fi

export JAVA_HOME=~/petclinic/usbstick/jdk1.7.0_80/

if [ -n "$(which mvn | grep /usr/bin/mvn)" ]
then
	echo "Found Maven.."
	echo "$(mvn --version)"
else
	echo "Installing Maven.."
	tar -xf ~/petclinic/usbstick/apache-maven-3.2.5-bin.tar.gz -C ~/petclinic/usbstick
	ln -sf ~/petclinic/usbstick/apache-maven-3.2.5/bin/mvn /usr/bin/mvn
fi

echo "Setting up server"
sudo nohup mvn -f ~/petclinic/pom_provision_demo.xml tomcat7:run &
sleep 1

echo "Provisioning Run Complete"
date
