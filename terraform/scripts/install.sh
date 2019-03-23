wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo sed -i 's/#Port\ 22/Port\ 17777/g' /etc/ssh/sshd_config
sudo service sshd restart

sudo apt-get update -y
sudo apt-get install openjdk-8-jre -y
sudo apt-get install jenkins -y