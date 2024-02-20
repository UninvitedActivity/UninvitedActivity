# Known Bad

I use these lists to block both incoming and outgoing connections. I also log any outbound connections to the IP addresses in these lists as potential Indicators of Compromise (IoC) of devices inside my networks.

 - https://feodotracker.abuse.ch/blocklist/ (Recommended IP blocklist and Botnet C2 Indicators of Compromise)
 - https://www.spamhaus.org/drop/ (DROP and EDROP)
 - https://www.blocklist.de/en/export.html (typ: all)

# DShield

DShield-progressive.txt is a progressively growing collection of IP address ranges that have made the the DShield daily-updated list of top 20 attacking class C subnets, located here:
https://www.dshield.org/block.txt.

I block all incoming traffic from this list.

I have no time frames for removal, I figure that if a large portion of a class C subnet is attacking, then it's a fairly systemic problem.
