# Intrusion Detection Systems Assignments
### 1. Configuration of Snort
You need 2 VMs for this assignment:
- an attacker VM (Kali prefered)
- a VM with Snort installed

1. Run `ifconfig`to see all network interfaces
2. Get your network interface and the corresponding IP address
3. Open `/etc/snort/snort.config`and modify `$_HOME_NET`with your IP address
4. Open `/etc/snort/rules/local.rules`and insert following rule: `alert icmp any any -> $HOME_NET any (msg:"machine was pinged"; sid:1000001; rev:1; classtype:icmp-event;)`
5. Run `starting snort: sudo snort -A console -q -u snort -g snort -c /etc/snort/snort.conf -i enp0s3` in `/snort/snort-2.9.13`
6. Ping IDS VM from attacker VM
7. IDS VM shows the configured alert

### 2. Interaction with a FTP Server
You need 2 VMs for this assignment:
- an attacker VM with vsftpd installed
- a VM with Snort and vsftpd installed. Add a user via `sudo adduser test`

Hint: If Snort doesn´t show alerts, maybe start it with option `-k none`

1. Get IP from attacker VM from configuration task
2. Create an alert which detects connections to ftp server on IDS VM  from attacker VM
3. Create an alert which detects failed authentications on IDS VM's ftp server

### 3. Port scans
1. Write a rule that is able to detect a TCP Scan on Port 22
2. Write a rule that is able to detect a FIN Scan on Port 80




# Honeypot Assignments

### 1. Medium Interactive SSH Honeypot

Use `cowrie`  to set up a SSH "vulnerability". Start the `cowrie`  docker container and configure it to open  a weak protected SSH port.

1. Run the Cowrie container and use docker publish parameter to bind port 22 from the hostmachine to port 2222 from the cowrie container <br> [Hint: docker run -p host_port:container_port cowrie:cowrie]
2. Open a new terminal and ssh into the machine [hint ssh root@localhost] ... But what is the password? Maybe try the most commonly used passwords ....
3. When you have access to the machine look around, find out what kind of machine this is, check that we are root and download some maleware (or wget any website). Did you find any hints you are in a Honeypot?
4. Now switch to the defender point of view: As you can see in the window,  where honeypot was started, cowrie logs everything we do.
5. When we use docker to access the container with `docker exec -ti cowrie bash` we can access the log files under `~/cowrie-git/var/log/cowrie/cowrie.json`
6. Downloaded files are located under `~/cowrie-git/var/lib/cowrie/downloads/`
7. Stop the container `docker stop cowrie`

### 2. Low Interactive HoneyTrap

1. Start the HoneyTrap container using docker-compose. Navigate to the directory `~/honeypot` and start the container(s) with `docker-compose up`  <br>[Note 1: This will start also a elasticsearch and kibana container, wich we will use in task 2.7]<br>[Note 2: Make sure you stopped the cowrie container, otherwise docker can't publish port 22 as the cowrie container is still publishing it]
2. Start a ssh-service on port 22 and a telnet- service on port 23. Take a look at the slides or look at the manuals [<https://docs.honeytrap.io/services/>]. The config file is located in the same directory and is  called `config.toml` <br>[Note: You don't need to edit the `docker-compose.yml` , it is configured for all tasks.]<br>[Note 2: You need to restart the docker honeytrap container `docker-compose restart honeytrap`]
3. Log in as root with SSH.<br>[Note: What is the password? Maybe take a second look at the `config.toml`.]
4. How does it differ from `cowrie`?
5. Now setup services `tcp/80` (for HTTP) and `tcp/443` (for HTTPS) to imitate an Webserver.<br>[Note 1: You need to restart the honeytrap server afterwards]<br>[Note 2: Try to access these sites from a browser]
6. Access these sites. What do you see?
7. [Optional] Visualize the honeypot events with Kibana. Use therefore the files in the config and docker-compose files in the `~/lecture/files/honeypot/task2/2.7`-folder
   1. Switch off the VM and give it the maximum of power you can afford.
   2. Add to file `/etc/sysctl.conf` the following content: `vm.max_map_count=262144` 
   3. sudo sysctl -p
   4. Head to `localhost:5601`. 
   5. Set `honeytrap`  as Index Pattern.
   6. Press on `Discover` on the left side and take a look at the events.
   7. In order to filter the cyclic heartbeat messages, use `NOT category: heartbeat` as a filter]
   
