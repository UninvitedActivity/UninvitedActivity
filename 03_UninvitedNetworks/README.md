# 03_Uninvited Activity

These are C-Class (/24) IP address ranges that I've chosen to block due to "enough" of the /24 range having caused uninvited activity on my nodes. They are distinct from the Internet Scanners in that they're either Cloud providers or don't mention any of their standard activity being to probe the IPv4 internet.

# How I Use

I block traffic from these IP address ranges to my service ports.

I have no time limit for removing the blocks of these networks. Like with the DShield list in Known Bad, the problems seem to be systemic and therefore there's likely ilittle will or motivation to do anything about the malicious traffic.

# Observations

In combination with blocking the Internet Scanners networks, these block lists, and the IP addresses in the "Rule 1" list, I get virtually zero uninvited activity on my mail server ports.

Throughout February a bunch of Cloudflare-owned IP addresses were sending out probes to port 8080 and 8443, hence the 03_CloudflareCom.txt file. This feels out of character for Cloudflare as they're a reverse proxying company, not a hosting company. Either way, those networks are now blocked from my open ports.

# Exclusions

The following lists are now excluded due to the potential that they were detected as a result of investigative packets coming in due to browsing traffic (I can't find sources of this being a "thing", but I read about it a while back).

## 1e100.net
03_1e100Net.txt

These are Google IP addresses which, when blocked, break some Internet connectivity on my home network, so whilst it remains listed here, I'm not currently using it for blocking. It's disappointing to me that even Google is now initiating probe traffic.

## Cloudflare
03_CloudflareCom.txt

Sites I host are blocked from receiving any traffic outside of Cloudflare, so I'm excluding Cloudflare from blocking for the time being.

## Google User Content
03_GoogleUserContent.txt

I'm not sure about this one, but I'm excluding it from blocking for a while to see if the IP address ranges still get listed in the database.
