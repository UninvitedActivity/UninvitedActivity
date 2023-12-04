# Rule Explanations

IP addresses that have scanned:

- Rule 1: mail server ports
- Rule 2: ports 1024 and below
- Rule 3: ports above 1024 from ports above 1024
- Rule 4: ports above 1024 from ports 1024 and below
- Rule 5: any other IPv4 uninvited activity

The "-Export" file contains all IP addresses from all rules.

I use Rule 1, 2, and 5 for traffic blocking. I use Rule 4 to detect potentially incorrect blocks. I occasionally use Rule 3 to see how many sites and services it breaks in order to work out additional tweaks to these rules.

# What Is This?
This is an IP address block list and a set of shell scripts that are intended to automatically create and update this list.

# Why Is This?
The idea is that, if there's traffic coming into a port behind which there's no service (and therefore there's no invitation for this traffic), then it's malicious and I don't want any data coming in from, or going out to, any such IP Addresses.

Essentially: Using uninvited activity on closed ports to provide an additional layer of protection to open ports.

This, specifically, is not an exercise in cleaning up log files. The log files need to remain 'dirty' for the logging to remain current.

# This Isn't Code!
I sort of disagree, but it's also as close as I can get, so tough, move on.

# Shell Scripts?!?
The scripts take logs from a specific OPNSense firewall rule (that detects and logs network traffic on non-open ports), manipulates the log file into a format that's updateable to a database, updates it to the database, outputs the relevant content of that database into a file that's readable by an OPNSense "Firewall Alias", and pushes the updated file to github, from where the Firewall Alias retrieves it.

The specific Firewall Alias is used to block incoming traffic to open ports as well as outgoing traffic to any port.

# Who Is This?
I'm reasonably technical, but more in a system / network administrative kind of way, I'm not a programmer / coder / wizard, and so there are probably a number of highly cringe-inducing methods I've implemented. This exercise was partially to see if I could string together a number of different things into a working system, including using awk, rsync-over-ssh, passwordless rsync / ssh, github, and creating and interacting with a (admittedly incredibly simple) database (without knowing anything about how to implement APIs as a safety barrier against direct database manipulation - however the database work is being done locally, not remotely, so that particular security risk is somewhat mitigated), how to use github and awk and rsync-over-ssh.

I've learnt a few things and enjoyed the process so far, so it's almost successful before it's complete.

# Future Considerations

- ~~Narrow down an update interval that's suitable~~
- ~~Updating of date stamp of continued activity by IP Addresses that are already in the system~~
  - Make it smarter to minimise database queries (not that performance is any kind of issue)
- ~~Add a counter to each IP address in the database to track the most active probe sources~~
- ~~Work out how to permanently add a custom script to OPNSense crontab~~
  - ~~Manual changes to the crontab get overwritten at seemingly random times~~
- Compare the new set of IP addresses against existing DB content to filter out duplicates in order to minimise database queries
- Regular dump and reload of database to put it into a logical IP Address order (like 'sort -uV')
- Consider durations before removal from the database / list
- Setup of additional nodes and their feed-in to the system
- Setup of dummy mail server(s) to catch exclusively mail-scanning IP addresses
- Grouping of large numbers of /24 IP Addresses into a /24 network ban rather than individual IP addresses
- Explain some details about the OPNSense firewall rules
- Record the IP / Port combination (for later consideration in pattern matching)

# Completed Future Considerations

- Tiers of Uninvited Activity based on which ports are being scanned, and from which ports the scans are initiated
  - Rules 1-5
- Narrow down an update interval that's suitable: Every 15 minutes
- Updating of date stamp of continued activity by IP Addresses that are already in the system
  - This is done using a dumb kludge, I'm not up to querying the database and returning data to use in a script as yet
- Add a counter to each IP address in the database to track the most active probe sources
- Work out how to permanently add a custom script to OPNSense crontab
  - Manual changes to the crontab get overwritten at seemingly random times

# Traps
In a few short days, this exercise has managed to block:
- Connections to a couple of VPS' that I run, so an allow list becomes a required aide to this kind of automated blocking (interesting how the IP addresses got on the list, requires further investigation)
- Incoming VPN connections that I don't want to block - so the firewall is somehow picking up unwanted traffic from known-friendly IP addresses (also interesting how the IP addresses got on the list, requires further investigation)
- The occasional IP Address registered to Akamai, Amazon, Cloudflare, Github, Google, and Microsoft. If nothing else, this is an interesting exercise as a view into the chaos that is Internet traffic.
  - I've only had to unblock a couple of these, one was required for Chromecasting (35.186.224.35) and another for work VPN authentication

# Observations
- The combination of Rule #1 blocks and network blocks in the blockNets.txt file has cut email server port probes down to zero in the last 24 hours.
  - I think this is primarily down the the blockNets.txt file, as I worked on this over the weekend as a concerted effort to block uninvited activity coming from a large number of IPs within a /24 range.
- Obvious in retrospect, but running a DHT scraper (bitmagnet) means your IP address is advertised all over the DHT and thus invites a veritable shitload of traffic, effectively quadrupling the size of the IP address blocklist within a week. I'm not sure how to manage all the additional IP addresses caused by this, but know that if I'm going to run a DHT scraper again, it's going to tunnel through somewhere other than where I'm gathering malicious IP addresses.
  - There's also the alternate perspective in that maybe it's just made the malicious IP address gathering much more efficient...
- There are separate sets of IP Addresses connecting to random ports versus those connecting to email server specific ports.
  - Subjectively, this indicates to me that IP addresses associated with mail server probes are more 'dangerous': they are directed, not just randomly scanning everything. This makes these IP addresses more valuable to block (I also understand that these IP addresses are likely to be drones in a botnet, and therefore not indicative of the actual malicious actors pulling the strings, but I'd still consider blocking these IP addresses as more worthwhile than those doing random port probes).
- OPNSense firewall rule identifiers change when the rule itself is slightly modified (and possibly when any rule is modified)
- OPNSense gets rid of my custom cron command when the firewall rules change

# Running Stats
- Database reset: 19/11/2023
- As of 04/12/2023:
  - Days running: 15
  - Rule 1:   278
  - Rule 2: 5,072
  - Rule 3: 6,749
  - Rule 4:   214
  - Rule 5:   355
  - Total: 12,668

# OLD:
- Running since: 01/10/2023
- As of 16/11/2023:
  - Days running: 46
  - Uninvited IP addresses: 86,953
- As of 30/10/2023:
  - Days running: 29
  - Uninvited IP addresses: 36,724
