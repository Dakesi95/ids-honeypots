sudo groupadd snort
sudo useradd snort -r -s /sbin/nologin -c SNORT_IDS -g snort
 
 
sudo mkdir /etc/snort
sudo mkdir /etc/snort/rules
sudo mkdir /etc/snort/rules/iplists
sudo mkdir /etc/snort/preproc_rules
sudo mkdir /usr/local/lib/snort_dynamicrules
sudo mkdir /etc/snort/so_rules
 
 
sudo touch /etc/snort/rules/iplists/black_list.rules
sudo touch /etc/snort/rules/iplists/white_list.rules
sudo touch /etc/snort/rules/local.rules
sudo touch /etc/snort/sid-msg.map
 
 
sudo mkdir /var/log/snort
sudo mkdir /var/log/snort/archived_logs
 
 
sudo chmod -R 5775 /etc/snort
sudo chmod -R 5775 /var/log/snort
sudo chmod -R 5775 /var/log/snort/archived_logs
sudo chmod -R 5775 /etc/snort/so_rules
sudo chmod -R 5775 /usr/local/lib/snort_dynamicrules
 
 
sudo chown -R snort:snort /etc/snort 
sudo chown -R snort:snort /var/log/snort 
sudo chown -R snort:snort /usr/local/lib/snort_dynamicrules
 
cd ~/snort/snort-2.9.13/etc/ 
sudo cp *.conf* /etc/snort 
sudo cp *.map /etc/snort 
sudo cp *.dtd /etc/snort 
cd ~/snort/snort-2.9.13/src/dynamic-preprocessors/build/usr/local/lib/snort_dynamicpreprocessor/ 
sudo cp * /usr/local/lib/snort_dynamicpreprocessor/
