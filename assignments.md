# Intrusion Detection Systems Assignments









# Honeypot Assignments

### 1. Setting up a SSH Honeypot

Use `cowrie`  to set up a SSH "vulnerability".  Start the `cowrie`  docker container and configure it to open  a weak protected SSH port.

1. Run the Cowrie container and use docker publish parameter to bind port 22 from the hostmachine to port 2222 from the cowrie container <br> [Hint: docker run -p host_port:container_port cowrie:cowrie]
2. Open a new terminal and ssh into the machine [hint ssh root@localhost] ... But what is the password? Maybe try the most commonly used passwords ....
3. When you have access to the machine look around, find out what kind of machine this is, check that we are root and download some maleware (or wget any website). Did you find any hints you are in a Honeypot?
5. Now switch to the defender point of view: As you can see in the window,  where honeypot was started, cowrie logs everything we do.
6. When we use docker to access the container with `docker exec -ti cowrie bash` we can access the log files under `~/cowrie-git/var/log/cowrie.cfg`
7. Downloaded files are located under `var/lib/cowrie/downloads/`
7. Stop the container `docker stop cowrie`



### 2. Setting up HoneyTrap

1. Start the HoneyTrap container using docker-compose. Navigate to the directory `~/honeypot` and start the container(s) with `docker-compose up`  <br>[Note 1: This will start also a elasticsearch and kibana container, wich we will use in task 2.7]<br>[Note 2: Make sure you stopped the cowrie container, otherwise docker can't publish port 22 as the cowrie container is still publishing it]
2. Start a ssh-service on port 22 and a telnet- service on port 23. Take a look at the slides or look at the manuals [<https://docs.honeytrap.io/services/>]. The config file is located in the same directory and is  called `config.toml` <br>[Note: You don't need to edit the `docker-compose.yml` , it is configured for all tasks.]<br>[Note 2: You need to restart the docker honeytrap container `docker-compose restart honeytrap`]
3. Log in as root with SSH.<br>[Note: What is the password? Maybe take a second look at the `config.toml`.]
4. How does it differ from `cowrie`?
5. Now setup services `tcp/80` (for HTTP) and `tcp/443` (for HTTPS) to imitate an Webserver.<br>[Note 1: You need to restart the honeytrap server afterwards]<br>[Note 2: Try to access these sites from a browser]
6. Access these sites. What do you see?
7. Visualize the honeypot Events with Kibana. Head to `localhost:5601`.
   1. Set `honeytrap`  as Index Pattern.
   2. Press on `Discover` on the left side and take a look at the events.
   3. [Optional] In order to filter the cyclic heartbeat messages, use `NOT category: heartbeat` as a filter]



Nice list of different types of honeypots:

<https://github.com/paralax/awesome-honeypots>