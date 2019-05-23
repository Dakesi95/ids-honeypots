# Intrusion Detection Systems Assignments
1. Teil: <br>
Live Traffic auswerten (Ping, FTP, ...), gewisse Maschinen blacklisten oder einfache Alerts erzeugen

2. Teil: <br>
Arbeiten mit einer PCAP

# Honeypot Assignments

### 1. Setting up a medium interactive SSH Honeypot 

Use `cowrie`  to set up a SSH "vulnerability".  Start the `cowrie`  docker container and configure it to open  a weak protected SSH port.

1. Run the Cowrie container and use docker publish parameter to bind port 22 from the hostmachine to port 2222 from the cowrie container (hint: docker run -p host_port:container_port cowrie:cowrie)
2. Open a new terminal and ssh into the machine (hint ssh root@localhost)... But what is the password? Maybe try the most commonly used passwords ....
3. When you get access to the machine look around, find out what kind of machine this is, check that we are root and download some maleware (or wget any website)
4. Try to find any evidence, that you are in a honeypot.
5. Now switch to the defender point of view: As you can see in the window you opened honeypot logs everything we do.
6. When we use docker to access the container with `docker exec -ti cowrie bash` we can access the log files under `~/cowrie-git/var/log/cowrie.cfg`
7. Downloaded files are located under `var/lib/cowrie/downloads/`



### 2. Setting up HoneyTrap low-interactive

1. Start the HoneyTrap container
2. HoneyTrap starts by default an SSH service -> Again login with SSH
3. How does it differ from `cowrie`?
4. Use the instructions to start services `tcp/80` (for HTTP) and `tcp/443` (for HTTPS) to simulate an Webserver
5. Access these sites. What do you see?
6. [Optional] Use the ElasticSearch and Kibana Services to create a visualization of the logs from our Honeypot

### 3. Setting up a high-interactive Honeypot with a honeywall
1. Start a "blank" Docker CentOS/Alpine Container 
2. Start the Honeywall on it
3. Work against the Honeywall
4. Look at the logs


Nice list of different types of honeypots:
<https://github.com/paralax/awesome-honeypots>