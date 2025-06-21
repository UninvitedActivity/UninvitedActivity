# Before The Other Information

The most value I've gotten from this project is the Internet Scanner and Uninvited Networks lists. These lists were only able to be made by gathering all IP addresses probing my network and then analysing the data for patterns.

So, for those of you interested in using data here for blocking traffic on your own networks, the two primary lists to start with would be:

1. https://raw.githubusercontent.com/UninvitedActivity/UninvitedActivity/main/02_InternetScanners/02_ZZInternetScannersSingleList.txt
2. https://raw.githubusercontent.com/UninvitedActivity/UninvitedActivity/main/03_UninvitedNetworks/03_ZZUninvitedActivityNetworks.txt

Please be aware that, with using these lists, I don't have any expiry dates built in. Yet. However, all of the data is less than 12 months old, with this project having started in October 2023.

The second most value I've gotten from this project is in discovery of other projects gathering similar lists of malicious IPs and Networks.
(I'll be updating the Other Lists README page, with a more refined lists of lists, in a few days)

# Update: 2025-0621
I have limited lists for Rules 2, 3, 4, and 5 to IP addresses that have probed my systems within the last 12 months. This has removed around a combined 46,000 IP addresses from those lists. 

# Update: 2024-08-12
I have deleted the set of IP addresses for Rule #4 as there were likely many false positives due to browsed websites (I'm looking at Google, Amazon and Facebook with disdain here) that send probe packets back to the IP addresses that are browsing them, thus setting off Rule #4 (coming from port 443, and sometimes 80, going to, I think, the port the browsing request came from).

I've attempted to block these requests now, so Rule #4 should be a 'cleaner' feed of Uninvited Activity and generate fewer false positives.

# What Is This?
This is a set of shell scripts that are intended to detect "uninvited activity" (un-requested and uninvited network traffic) and automatically create and update a (set of) IP address block lists based on this uninvited activity.

# Why Is This?
The idea is that, if there's traffic coming into a port behind which there's no service (and therefore there's absolutely no good reason for this trafffic to exist), then it must be malicious. If it's malicious, then I have no reason to trust any data coming from that IP address.

Essentially: Using uninvited activity on any closed (red) ports to block access to any open (green) ports.

![Ports](https://github.com/UninvitedActivity/UninvitedActivity/blob/09d8f420df78cd6ba3352dbde0339ca3e51a6be8/Ports-ClosedOpen.png)

This is specifically not an exercise in cleaning up log files. The log files need to remain 'dirty' for the blocking to remain current.

# Rule Explanations

IP addresses that have scanned:

- Rule 1: mail server ports
- Rule 2: ports 1024 and below
- Rule 3: ports above 1024 from ports above 1024
- Rule 4: ports above 1024 from ports 1024 and below
- Rule 5: any other IPv4 uninvited activity

The "-Export" file contains all IP addresses from all rules.

I use Rule 1, 2, and 5 for traffic blocking. I use Rule 4 to detect potentially incorrect blocks. I occasionally use Rule 3 to see how many sites and services it breaks in order to work out additional tweaks to these rules.

# This Isn't Code!
I sort of disagree, but it's also as close as I can get, so tough, move on.

# Shell Scripts?!?
The scripts take logs from a specific OPNSense firewall rule (that detects and logs network traffic on non-open ports), manipulates the log file into a format that's updateable to a database, updates it to the database, outputs the relevant content of that database into a file that's readable by an OPNSense "Firewall Alias", and pushes the updated file to github, from where the Firewall Alias retrieves it.

The specific Firewall Alias is used to block incoming traffic to open ports as well as outgoing traffic to any port.

# Who Is This?
I'm reasonably technical, but more in a system / network administrative kind of way, I'm not a programmer / coder / wizard, and so there are probably a number of highly cringe-inducing methods I've implemented. This exercise was partially to see if I could string together a number of different things into a working system, including using awk, rsync-over-ssh, passwordless rsync / ssh, github, and creating and interacting with a (admittedly incredibly simple) database (without knowing anything about how to implement APIs as a safety barrier against direct database manipulation - however the database work is being done locally, not remotely, so that particular security risk is somewhat mitigated), and how to use github as a repository for both the scripts and the block lists.

I've learnt a few things and enjoyed the process so far, so it's almost successful before it's complete.

# Future Considerations

- Autoupdate the running stats for each rule at the end of this README
- ~~Narrow down an update interval that's suitable~~
- ~~Updating of date stamp of continued activity by IP Addresses that are already in the system~~
  - Make it smarter to minimise database queries (not that performance is any kind of issue)
- ~~Add a counter to each IP address in the database to track the most active probe sources~~
- ~~Work out how to permanently add a custom script to OPNSense crontab~~
  - ~~Manual changes to the crontab get overwritten at seemingly random times~~
- Compare the new set of IP addresses against existing DB content to filter out duplicates in order to minimise database queries
- Regular dump and reload of database to put it into a logical IP Address order (like 'sort -uV')
  - Downgraded priority, as it just doesn't really matter the order in which it's stored in the DB. That's one of the beauties of a DB.
- Consider durations before removal from the database / list
- Setup of additional nodes and their feed-in to the system
  - "Appliance" like setup option
- Setup of dummy mail server(s) to catch exclusively mail-scanning IP addresses
  - Downgraded priority, as with the current set of rules and blocks there's very little mail server probing any more
- Grouping of large numbers of /24 IP Addresses into a /24 network ban rather than individual IP addresses
- Explain some details about the OPNSense firewall rules
- Record the IP / Port combination (for later consideration in pattern matching)

# Completed Future Considerations

- Added a new detection node, from setup to feed-in and verification
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
  - Update 09/12/2023: Still getting very occasional probes on the mail server ports, but absolutely minimal volume, almost nothing. Feels like a good result.
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
