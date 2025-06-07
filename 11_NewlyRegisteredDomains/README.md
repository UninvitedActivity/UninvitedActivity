# Newly (Recently) Registered Domains (NRDs / RRDs)

I have implemented a process using the script from PeterDaveHello (linked below) to create a set of Newly Registered Domain DNS block lists for Pi-Hole. The raw lists will be published into this (11_NewlyRegisteredDomains) directory, whilst the Pi-Hole compatible lists will be published into the PiHole directory.

This is the implemented process:

- Run the script daily to capture NRDs for the day (this also now downloads the 7-day NRD list from ShrestaIT and the 14-day list from xRuffKez - both of which are linked to below)
- Populate these into a database with a date stamp
- Extract a list of all domain names that have been created within certain timeframes:
  - 14 days
  - 1 month
  - 3 months
  - 6 months
  - 12 months 
- Publish these to the 11_NewlyRegisteredDomains directory
- Extract the list of all domain names within the above timeframes, preceding them with 0.0.0.0 to make them Pi-Hole compatible 
- Publish these to the PiHole directory
- Setup my Pi-Hole(s) to use the 6 months list

This was initially implemented on the 1st of June 2025, so it only contains NRDs listed since that date (which means, at the current time of the 3rd of June, all the lists are going to look identical and it'll take a while until they're all living up to their names).

It should be noted that the default setup of a Pi-Hole updates the ad lists once a week. This is, somewhat at least, in order to make sure that each Pi-Hole instance is a good Internet citizen and isn't causing more internet traffic than necessary. This, however, means that any daily updates to these NRD lists is not integrated into a default Pi-Hole's blocking until up to a week later.


## Reference / Source Sites

- https://github.com/PeterDaveHello/nrd-list-downloader
  - The whoisds.com list seems to be limited to 70,000 entries (this is a lot and yet still limited)
- https://shreshtait.com/blog/2024/02/recently-registered-domains-download/
  - The weekly list doesn't contain anywhere near the number of domain names as the whoisds.com lists
- https://github.com/xRuffKez/NRD
