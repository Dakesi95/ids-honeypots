echo "Install required plugins"
sudo apt-get install -y build-essential
sudo apt-get install -y libpcap-dev libpcre3-dev libdumbnet-dev
sudo apt-get install -y zlib1g-dev liblzma-dev openssl libssl-dev
sudo apt-get install -y bison flex

echo "Install Lua"
mkdir ~/luajit && cd ~/luajit
wget http://luajit.org/download/LuaJIT-2.0.5.tar.gz
tar -xvzf LuaJIT-2.0.5.tar.gz && cd LuaJIT-2.0.5
make
sudo make install
sudo apt-get install -y liblua5.1-0-dev

echo "Install daq"
mkdir ~/snort && cd ~/snort
wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz
tar -xvzf daq-2.0.6.tar.gz && rm -r daq-2.0.6.tar.gz && cd daq-2.0.6
./configure
make
sudo make install

echo "## Install snort
cd ~/snort
wget https://www.snort.org/downloads/snort/snort-2.9.13.tar.gz
tar -xvzf snort-2.9.13.tar.gz && rm -r -xvzf snort-2.9.13.tar.gz && cd snort-2.9.13/
./configure
make
sudo make install
sudo ldconfig
sudo ln -s /usr/local/bin/snort /usr/sbin/snort
