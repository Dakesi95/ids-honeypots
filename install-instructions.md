# 1. Install Snort

### 1.1 Bring dist to latest release

1. sudo apt-get update
2. sudo apt-get dist-upgrade

Restart machine afterwards.

The `/install-scripts/install-snort.sh` will do subsection 1.2, 1.3, 1.4, 1.5.

### 1.2 Install required plugins

1. sudo apt-get install build-essential
2. sudo apt-get install -y libpcap-dev libpcre3-dev libdumbnet-dev
3. sudo apt-get install -y zlib1g-dev liblzma-dev openssl libssl-dev
4. sudo apt-get install bison flex

### 1.3 Install Lua

The following commands will download the Lua Just-in-time-compiler in the home directory. It is required by Snort:

1. mkdir ~/luajit && cd  ~/luajit
2. wget http://luajit.org/download/LuaJIT-2.0.5.tar.gz
3. tar -xvzf LuaJIT-2.0.5.tar.gz && cd LuaJIT-2.0.5
4. make
5. sudo make install
6. sudo apt-get install liblua5.1-0-dev


### 1.4 Install daq

1. mkdir ~/snort && cd ~/snort
2. wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz
3. tar -xvzf daq-2.0.6.tar.gz && cd daq-2.0.6
4. ./configure
5. make
6. sudo make install

### 1.5 Install snort

1. cd ~/snort
2. wget https://www.snort.org/downloads/snort/snort-2.9.13.tar.gz
3. tar -xvzf snort-2.9.13.tar.gz && cd snort-2.9.13/
4. ./configure
5. make
6. sudo make install
7. sudo ldconfig
8. sudo ln -s /usr/local/bin/snort /usr/sbin/snort

snort is now installed. Check it out with `snort -V`

### 1.6 Create Snort Folders
Snort need some folder and files to place its logs, errors and rule-files. Run the `/install-scripts/setup-dirs.sh`script with to set these up.

### 1.7 Configure Snort
To configure Snort, run `/install-scripts/snort-config.sh`

## 2. Install Docker
### 2.1 Install Docker on Kali

Use the `/install-scripts/install-docker.sh` script or the following commands to install Docker on Kali:

1. curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add
2. echo 'deb https://download.docker.com/linux/debian stretch stable' > /etc/apt/sources.list.d/docker.list
3. apt-get update
4. apt-get remove docker docker-engine docker.io
5. apt-get install docker-ce
6. sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
7. sudo chmod +x /usr/local/bin/docker-compose 



### 2.2 Install Docker on Ubuntu

sudo snap install docker



## 3. Pull required Docker containers

1. Cowrie:
  * docker pull cowrie/cowrie
  * mkdir ~/cowrie
  * cd ~/cowrie
   
2. HoneyTrap
   * docker pull honeytrap/honeytrap
   * mkdir ~/honeytrap
   * docker network create honeytrap
   * cd ~/honeytrap
   * mkdir -p /data/elasticsearch/data **&&** sudo chown -R 1000:1000 /data/elasticsearch
