# 03_Uninvited Activity

These are C-Class (/24) IP address ranges that I've chosen to block due to "enough" of the /24 range having caused uninvited activity on my nodes. They are distinct from the Internet Scanners in that they're either Cloud providers or don't mention any of their standard activity being to probe the IPv4 internet.

# How I Use

I block traffic from these IP address ranges to my service ports.

I have no time limit for removing the blocks of these networks. Like with the DShield list in Known Bad, the problems seem to be systemic and therefore there's likely ilittle will or motivation to do anything about the malicious traffic.

# Observations

In combination with blocking the Internet Scanners networks, these block lists, and the IP addresses in the "Rule 1" list, I get virtually zero uninvited activity on my mail server ports.

# Exclusions

03_1e100Net.txt: These are Google IP addresses which, when blocked, break some Internet connectivity on my home network, so whilst it remains listed here, I'm not currently using it for blocking. It's disappointing to me that even Google is now initiating probe traffic.

I'm interested to see if the 'probe counters' slowly increase, or whether a larger portion of the network are detected as sources of these probes, as time goes by.
