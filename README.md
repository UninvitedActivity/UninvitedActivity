# What is this?
This is an IP address block list and a set of bash scripts that are intended to automatically create and update this list.

# Why is this?
The idea is that, if there's traffic coming into a port behind which there's no service (and therefore there's no invitation for this traffic), then it's malicious and I don't want any data coming in from, or going out to, such IP Addresses. My theory is that if they stumble onto an open port, they'll be back.

# This isn't Code!
I sort of disagree, but it's also as close as I can get. Tough, move on.

# Bash Scripts?!?
The scripts take logs from a specific OPNSense firewall rule, that detects and reports network traffic on non-open ports, and manipulates the log file into a format that's updateable to a database, updates it to the database, then outputs the content of that database into a file that's readable by an OPNSense "Firewall Alias", such that the list of IP addresses is added to an incoming and outgoing block list.

# Who is this?
I'm reasonably technical, but more in a system / network administrative kind of way, I'm not a programmer / coder / wizard, and so there are probably a number of highly cringe-inducing methods I've implemented. This exercise was partially to see if I could string together a number of different things into a working system, including creating and interacting with an admittedly incredibly simple database (without knowing anything about how to implement APIs as a safety barrier against direct database manipulation - however the database work is being done locally, not remotely, so that particular security risk is somewhat mitigated), how to use github and awk and rsync-over-ssh.

I've learnt a few things and enjoyed the process so far, so it's almost successful before it's complete.

# Future considerations

- Updating of date stamp of continued activity by IP Addresses that are already in the system
- Regular dump and reload of database to put it into a logical IP Address order (sort -uV)
- Consider durations before removal from the database / list
- Setup of additional nodes and their feed-in to the system
- Setup of dummy mail server(s) to catch exclusively mail-scanning IP addresses
- Grouping of large numbers of /24 IP Addresses into a /24 network ban rather than individual IP addresses
- Explain some details about the OPNSense firewall rules
- Record the IP / Port combination (for later consideration in pattern matching)

# Completed Future considerations

- Narrow down an update interval that's suitable: Every 15 minutes

# Traps
In a few short days, this exercise has managed to block:
- Connections to a couple of VPS' that I run, so an allow list becomes a required aide to this kind of automated blocking (interesting how the IP addresses got on the list, requires further investigation)
- Incoming VPN connections that I don't want to block - so the firewall is somehow picking up unwanted traffic from known-friendly IP addresses (also interesting how the IP addresses got on the list, requires further investigation)
- The occasional IP Address registered to Akamai, Amazon, Cloudflare, Github, Google, and Microsoft. If nothing else, this is an interesting exercise as a view into the chaos that is Internet traffic.
  - I've only had to unblock a couple of these, one was required for Chromecasting (35.186.224.35) and another for work VPN authentication

# Observations
- There are separate sets of IP Addresses connecting to random ports versus those connecting to email server specific ports.
  - Subjectively, this indicates to me that IP addresses associated with mail server probes are more 'dangerous': they are directed, not just randomly scanning everything. This makes these IP addresses more valuable to block (I also understand that these IP addresses are likely to be drones in a botnet, and therefore not indicative of actual attackers, but I'd still consider blocking these IP addresses as more worthwhile than those doing random port probes.
