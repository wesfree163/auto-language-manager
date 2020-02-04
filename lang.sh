#!/bin/bash

echo installing java tools for cli
 sudo apt-get update && apt-get upgrade
 sudo apt-get install default-jdk
 sudo apt-get install software-properties-common
 sudo add-apt-repository ppa:linuxuprising/java
 sudo apt-get update
 sudo apt-get install oracle-java11-installer
 sudo apt-get install oracle-java13-installer
 javac --version
 java --version
#  clear

echo
echo installing nodejs tools for cli
 curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
 sudo apt install nodejs
 node --version
 npm --version
#  clear

echo
echo installing python3 tools for cli
 sudo add-apt-repository ppa:deadsnakes/ppa
 sudo apt install python3.7 
 python3.7 --version
#  clear

echo
echo installing python2 tools for cli
 sudo apt-get install build-essential checkinstall
 sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
 cd
 cd /usr/src
 sudo wget https://www.python.org/ftp/python/2.7.16/Python-2.7.16.tgz
 sudo tar xzf Python-2.7.16.tgz
 cd Python-2.7.16
 sudo ./configure --enable-optimizations
 sudo make altinstall
#  clear

echo
echo installing docker tools for cli
 curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
 echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' > /etc/apt/sources.list.d/docker.list
#  apt-get remove docker docker-engine docker.io
 sudo apt-get install docker-ce
 docker run hello-world
 systemctl start docker
 systemctl enable docker
#  clear

echo
echo installing snapcraft for building from snap
 sudo apt update
 sudo apt install snapd
 sudo snap install hello-world
 hello-world
#  clear

echo
echo installing amass for domain enumeration

#  build from docker
#  docker build -t amass https://github.com/OWASP/Amass.git
#  docker run -v OUTPUT_DIR_PATH:/.config/amass/ amass enum --list
#  docker run -v OUTPUT_DIR_PATH:/.config/amass/ amass enum -brute -w /wordlists/all.txt -d example.com

#  build from snapcraft
 sudo snap install amass
 export PATH=$PATH:/snap/bin
 sudo snap refresh
#  clear

echo
echo installing torghost for ip shuffling
 cd
 git clone https://github.com/susmithHCK/torghost.git
 cd torghost
 chmod +x install.sh
 ./install.sh
#  runs better with tormods from java samples
#  torghost start, stop, switch
#  java torghoul
#  clear

echo
echo installing Ruby Gems & Jekyll
 sudo apt-get install ruby-full build-essential zlib1g-dev
 echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
 echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
 echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
 source ~/.bashrc
 gem install jekyll bundler
#  clear

echo
echo installing Bundler
 gem install bundler
#  clear

echo
echo installing openssh-server
 cd
 sudo apt-get install openssh-server
 update-rc.d -f ssh remove
 update-rc.d -f ssh defaults
 cd /etc/ssh/
 mkdir insecure_original_default_kali_keys
 mv ssh_host_* insecure_original_default_kali_keys/
 dpkg-reconfigure openssh-server
#  if you want to enable ssh login thru root you will need to
#  edit /etc/ssh/sshd_config and change line 
#  PermitRootLogin without-password to PermitRootLogin yes
#  restart ssh: sudo service ssh restart
#  make sure service always restarts on reboot: update-rc.d -f ssh enable 2 3 4 5
#  clear