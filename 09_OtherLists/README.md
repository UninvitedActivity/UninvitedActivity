# Other Lists

These are almost entirely based on lists provided from https://iplists.firehol.org because they gather and normalise a whole heap of other useful lists. They've done all the hard work. 

This is also a good source of firehol related info: https://github.com/firehol/blocklist-ipsets

## Base Blocking

- Firehol lists
  - https://iplists.firehol.org/files/dshield_7d.netset
    - Info: https://iplists.firehol.org/?ipset=dshield_7d
  - https://iplists.firehol.org/files/firehol_level1.netset
    - Info: https://iplists.firehol.org/?ipset=firehol_level1
    - Note: This list contains private IP address ranges, so ensure there are existing firewall rules to allow local traffic as necessary!
  - https://iplists.firehol.org/files/firehol_webclient.netset
    - Info: https://iplists.firehol.org/?ipset=firehol_webclient
- Krasue malware C&C server: 128.199.226.11

## Recommended Blocking

- Firehol lists
  - https://iplists.firehol.org/files/firehol_abusers_1d.netset
    - info: https://iplists.firehol.org/?ipset=firehol_abusers_1d
  - https://iplists.firehol.org/files/dshield_30d.netset
    - info: https://iplists.firehol.org/?ipset=dshield_30d
  - https://iplists.firehol.org/files/firehol_level2.netset
    -info: https://iplists.firehol.org/?ipset=firehol_level2
- Uninvited Activity
  - https://raw.githubusercontent.com/UninvitedActivity/UninvitedActivity/main/uninvitedActivity-Rule1.txt
    - Info: https://github.com/UninvitedActivity/UninvitedActivity
- Internet Scanners
  - ASNs
    - Alpha Strike Labs: 208843
    - Censys: 398324, 398705, 398722
    - Security Trails: 211607
  - 3rd Party lists:
    - Info: Description: https://github.com/wdes/security
    - https://security.wdes.eu/scanners/stretchoid.txt
    - https://security.wdes.eu/scanners/binaryedge.txt
  - Uninvited Activity Lists:
    - Info: https://github.com/UninvitedActivity/UninvitedActivity/tree/main/02_InternetScanners
    - https://raw.githubusercontent.com/UninvitedActivity/UninvitedActivity/main/02_InternetScanners/02_ZZInternetScannersSingleList.txt 

## Aggressive Blocking

- Firehol lists:
  - https://iplists.firehol.org/files/firehol_abusers_30d.netset
    - Info: https://iplists.firehol.org/?ipset=firehol_abusers_30d
  - https://iplists.firehol.org/files/cybercrime.ipset
    - Info: https://iplists.firehol.org/?ipset=cybercrime
  - https://iplists.firehol.org/files/firehol_level3.netset
    -info: https://iplists.firehol.org/?ipset=firehol_level3
    - Note: This has, in the past and possibly presently as well, contained Google's DNS resolver 8.8.8.8, Quad9's DNS resolver 9.9.9.9, Github IP addresses, and various others that are relatively normal internet usage. It's highly likely that exception rules will need to be put in place if using this list. Use this list with care and knowledge.
- Uninvited Activity lists:
  - https://raw.githubusercontent.com/UninvitedActivity/UninvitedActivity/main/uninvitedActivity-Rule2.txt
    - Info: https://github.com/UninvitedActivity/UninvitedActivity
  - https://raw.githubusercontent.com/UninvitedActivity/UninvitedActivity/main/uninvitedActivity-Rule5.txt
    - Info: https://github.com/UninvitedActivity/UninvitedActivity
  - https://github.com/UninvitedActivity/UninvitedActivity/raw/main/01_KnownBad/DShield-progressive.txt
    - Info: https://github.com/UninvitedActivity/UninvitedActivity/tree/main/01_KnownBad
  - Uninvited Activity Networks:
    - https://raw.githubusercontent.com/UninvitedActivity/UninvitedActivity/main/03_UninvitedNetworks/03_ZZUninvitedActivityNetworks.txt
      - Info: https://github.com/UninvitedActivity/UninvitedActivity/tree/main/03_UninvitedNetworks
    - ASNs:
      - BT Hoster: 198465
      - Click Telecom Brazil: 264867
      - Emmanuel Hosting: 215766
      - Husam Network: 47154
      - IPv4 Superhub: 209178
      - IP Volume Inc: 202425, 204655
      - Mint Telecom: 213382
      - Tamitaya: 50360

## Paranoid Blocking

- https://raw.githubusercontent.com/UninvitedActivity/UninvitedActivity/main/uninvitedActivity-Rule3.txt
  - Info: https://github.com/UninvitedActivity/UninvitedActivity
- https://raw.githubusercontent.com/UninvitedActivity/UninvitedActivity/main/uninvitedActivity-Rule4.txt
  - Info: https://github.com/UninvitedActivity/UninvitedActivity

## Prior Other Lists Content

These are other lists that I use for blocking both Inbound and Outbound traffic.

- https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_abusers_1d.netset
- https://www.spamhaus.org/drop/edrop.txt
- https://iplists.firehol.org/files/dshield.netset
- https://feodotracker.abuse.ch/downloads/ipblocklist_recommended.txt
- https://raw.githubusercontent.com/ktsaou/blocklist-ipsets/master/firehol_level2.netset
- https://raw.githubusercontent.com/ktsaou/blocklist-ipsets/master/firehol_level3.netset
- https://raw.githubusercontent.com/ktsaou/blocklist-ipsets/master/firehol_webclient.netset
- https://raw.githubusercontent.com/UninvitedActivity/UninvitedActivity/main/psbl-sorted.txt
- https://raw.githubusercontent.com/stamparm/ipsum/master/levels/1.txt
