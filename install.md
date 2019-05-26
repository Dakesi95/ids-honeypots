# Snort

## Bring dist to latest release

1. sudo apt-get update
2. sudo apt-get dist-upgrade

Restart machine afterwards.

## Install Lua

The following commands will download the Lua Just-in-time-compiler in the home directory. It is required by Snort:

1. mkdir ~/luajit && cd  ~/luajit
2. wget http://luajit.org/download/LuaJIT-2.0.5.tar.gz
3. tar -xvzf LuaJIT-2.0.5.tar.gz && cd LuaJIT-2.0.5
4. make
5. sudo make install
6. sudo apt-get install liblua5.1-0-dev

## Install required plugins

1. sudo apt-get install build-essential
2. sudo apt-get install -y libpcap-dev libpcre3-dev libdumbnet-dev
3. sudo apt-get install -y zlib1g-dev liblzma-dev openssl libssl-dev
4. sudo apt-get install bison flex
5. sudo make install

## Install daq

1. mkdir ~/snort && cd ~/snort
2. wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz
3. tar -xvzf daq-2.0.6.tar.gz && cd daq-2.0.6
4. ./configure
5. make
6. sudo make install

## Install snort

1. cd ~/snort
2. wget https://www.snort.org/downloads/snort/snort-2.9.13.tar.gz
3. tar -xvzf snort-2.9.13.tar.gz && cd snort-2.9.13/
4. ./configure
5. make
6. sudo make install
7. sudo ldconfig
8. sudo ln -s /usr/local/bin/snort /usr/sbin/snort

snort is now installed. Check it out with `snort -V`

Snort need some folder and files to place its logs,errors and rules files, therefore run the `setup-dirs.sh`script with `sh setup-dirs.sh`

## Install Docker on Kali Linux

Use the `install-scripts/install-docker.sh` script or the following commands to install Docker on Kali:

1. curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add
2. echo 'deb https://download.docker.com/linux/debian stretch stable' > /etc/apt/sources.list.d/docker.list
3. apt-get update
4. apt-get remove docker docker-engine docker.io
5. apt-get install docker-ce
6. sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
7. sudo chmod +x /usr/local/bin/docker-compose

<br><br>

To install Docker on Ubuntu:
1. sudo snap install docker



## Docker container

1. Cowrie:
   1. docker pull cowrie/cowrie
   2. mkdir ~/cowrie
   3. cd ~/cowrie
   4. `docker-compose.yml` to `~/cowrie`
   5. docker-compose up 
   
2. HoneyTrap
   1. mkdir ~/honeytrap
   2. docker network create honeytrap
   3. sudo mkdir -p /data/elasticsearch/data **&&** sudo chown -R 1000:1000 /data/elasticsearch
   4. cd ~/honeytrap
   5. copy `config.toml` to `~/honeytrap`
   6. copy `docker-compose.yml` to `~/honeytrap`
   7. docker-compose up