# Internet Scanners

These are organisations that appear to scan multiple ports of a fair swag of the IPv4 range.

Most of them have websites that say they provide legit security knowledge and data to governments, researchers, and other organisations. Most of them won't even give you a reacharound (censys.io, criminalIP, and internet-measurement are the exceptions).


I don't trust them, they're holding searchable details of whatever they can find by probing open ports on your IP addresses. I don't want that information to be in anyone else's database and neither should you. They also profit from it. Fuck 'em!

A good article on the topic: https://www.hackerfactor.com/blog/index.php?/archives/775-Scans-and-Attacks.html 

# How I Use

I block traffic both to and from these IP address ranges. 

# Observations

Since I learnt of, tracked down, and block-listed a bunch of these organisations, Uninvited Activity on mail-server related ports dropped to almost nothing immediately.

# Like-Minded

https://github.com/datacenters-network/security/ Who also links to:
- https://github.com/szepeviktor/debian-server-tools/tree/master/security/myattackers-ipsets/ipset
- https://github.com/wravoc/authlog-threats/blob/main/scanners
- https://github.com/stamparm/maltrail/blob/master/trails/static/mass_scanner.txt

# The Internet Scanners

## Alpha Strike Labs

https://www.alphastrike.io/en/

I block Alpha Strike via their ASN: 208843.

## Anubis Networks / BitSight

https://www.anubisnetworks.com/

BitSight purchase of Anubis Networks: https://www.bitsight.com/press-releases/news/bitsight-acquires-innovative-security-intelligence-company-anubisnetworks

https://www.bitsight.com/

https://www.internet-census.org

## Censys.io

https://censys.com/

Search their database: https://search.censys.io/

I've started blocking Censys via their ASNs: 398324, 398705, and 398722.

## Criminal IP

https://www.criminalip.io/ (contains a search bar)

https://security.criminalip.com/

https://www.aispera.com

## Internet Albedo

https://www.internet-albedo.net/

https://www.netscout.com/

## Internet Measurement

https://internet-measurement.com/

https://driftnet.io/ (can search for an IP address on this page)

## Leak IX / I9 Scanner

https://leakix.org

Vulnerability search engine like Shodan.io by the looks.

## Palo Alto Networks

https://www.paloaltonetworks.com/

## Rapid7

https://www.rapid7.com/

## Recyber

https://www.recyber.net/

## Security Trails

https://securitytrails.com/

These guys are a subsidiary of Recorded Future. They appear to publish a fair bit of useful information, but I still don't trust them because they've got a big store of historic IP address / port scan / DNS data to correlate.

I block Security Trails by their ASN: 211607.

## Shadow Server

https://www.shadowserver.org/

## Shodan

Surprisingly they haven't hit my radar yet, but there may be other blocklists I'm using that already disqualify them.

## Stretchoid.com

The least trustworthy looking website which coincidentally asks you to enter your IP address in order to add it to their 'do not scan' list. Sus. Don't give 'em nothin'.

https://stretchoid.com
