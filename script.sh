#!/bin/bash
echo "1111111111111111111111111111111111111111111111111111111111111111111111"
sudo apt-get update -y
sudo apt-get upgrade -y
echo "2222222222222222222222222222222222222222222222222222222222222222222222"
sudo apt-get install openjdk-11-jdk openjdk-8-jre -y
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
echo "3333333333333333333333333333333333333333333333333333333333333333333333"
sudo apt-get update -y
sudo apt-get install jenkins -y
echo "4444444444444444444444444444444444444444444444444444444444444444444444"
sudo service jenkins start -y
echo "5555555555555555555555555555555555555555555555555555555555555555555555"
echo "Password to jenkins "
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
sudo service jenkins status -y
echo "6666666666666666666666666666666666666666666666666666666666666666666666"
#sudo reboot
