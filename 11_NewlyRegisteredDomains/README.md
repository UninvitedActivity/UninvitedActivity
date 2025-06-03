# Newly (Recently) Registered Domains (NRDs / RRDs)

I have implemented a process using the script from PeterDaveHello (linked below) to create a set of Newly Registered Domain DNS block lists for Pi-Hole. The raw lists will be published into this (11_NewlyRegisteredDomains) directory, whilst the Pi-Hole compatible lists will be published into the Pihole directory.

This is the implemented process:

- Run the script daily to capture NRDs for the day
- Populate these into a database with a date stamp
- Extract a list of all domain names that have been created within certain timeframes:
  - 7 days
  - 14 days
  - 1 month
  - 3 months
  - 6 months
  - 12 months 
- Publish these to the 11_NewlyRegisteredDomains directory
- Extract the list of all domain names within the above timeframes, preceding them with 0.0.0.0 to make them Pi-Hole compatible 
- Publish these to the PiHole directory
- Setup my Pi-Hole(s) to use the 6 months list

## Reference / Source Sites

- https://github.com/PeterDaveHello/nrd-list-downloader
- https://shreshtait.com/blog/2024/02/recently-registered-domains-download/
- https://github.com/xRuffKez/NRD
