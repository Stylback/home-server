# Server-Journey
A collection of thoughts and notes as I build my home server.

If you find anything useful, feel free to use it in your own project!

--------------------

## The overall idea
My home server will be a budget-friendly, low maintance system running Ubuntu Server 22.04 LTS with Docker containers. I will be using my server for cloud storage, file synchronisation and media streaming. 

I will access my server by connecting to a domian, mapping subdomains to services and handle requests with a reverse-proxy.

Initially it will be used for cloud storage, file synchronisation and media streaming. Later on I hope to expand its uses to serve a static webpage

## Hardware
A balance must be struck between price, performance, expandability and power draw. Thankfully, there are plenty of hardware options to choose from and I will be able to make a system that's tailored to my specific needs.

| Component type | Model name | Price (SEK*) |
| :--- | :--- | ---: |
| [CPU / Motherboard](###cpu-/-motherboard)| [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013)| 1320 |
| [Power supply](###power-supply) | [be quiet! SYSTEM POWER B9 (_300 W_)](https://www.bequiet.com/en/powersupply/1285) | 440 |
| [Case](###case) | [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html)| 380 |
| [RAM](###ram) | [Corsair Venegance 2400 MHz 8 GB x 2](https://www.corsair.com/us/en/Categories/Products/Memory/VENGEANCE-LPX/p/CMK8GX4M1A2400C16)| 500 |
| [Storage](###storage) | [Crucial MX500 (_250 GB + 2 TB_)](https://www.crucial.com/products/ssd/crucial-mx500-ssd) | 2180 |
| __Total:__ |  | 4820 |

[_*10 SEK = ~1 USD_ ](https://www.xe.com/currencyconverter/convert/?Amount=10&From=SEK&To=USD)

### CPU / Motherboard
As I don't expect to be using resource-heavy services such as multiple desktop VM:s, 4K-encoding or multi-user streaming I've settled for an [intel Celeron J4105](https://www.intel.com/content/www/us/en/products/sku/128989/). Despite being launched at the end of 2017 it has a set of very useful features for my use case:

- 12 execution units
- Integrated Graphics
- Intel Quick Sync Video support
- 10 W (!) TDP

The J-series is only available in "CPU-onboard"-motherboards. I've opted for a [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013) due to its low cost, but you might consider the [ASRock ITX-J4105](https://www.asrock.com/mb/Intel/J4105-ITX/index.us.asp) if you want more SATA III-connectors.

### Power supply (PSU)
Ideally, the server will be running 24/7, 365 days a year. As such, high PSU efficiency is important to keep upkeep-cost down. __A power supply is at its most efficient at 50% of maximum rated load__, this means a PSU rated at 500 W max load will be at its most efficient when it provides 250 W of power.

__What is the efficiency at 50% load?__ That is determined by the [80+ Rating](https://en.wikipedia.org/wiki/80_Plus). A 80+ White will be 80-85% efficient at 50% load while a 80+ Titanium will be 94-96% efficient.

After some ["back of the napkin calculations"](#approximating-power-draw) I've estimated my system to draw between 10-23 W. As such my ideal PSU would be a power-brick style 50-100 W PSU. I've had no luck finding such a model with the right mix of power-cables (24-pin, 4-pin, SATA) and have instead opted for a [be quiet! SYSTEM POWER B9](https://www.bequiet.com/en/powersupply/1285). At 300 W, It offers a better low-load efficiency than its 450-500 W counterparts while still offering some head-room for upgrades. It also has all the power-cables I require.

### Case
I wanted something cheap and discreet with some room for expandability. The [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html) ticked all my boxes.

### RAM
As stated on intel's, Biostar's and ASRock's websites: The J4105 _officially_ only supports 8 GB of RAM.
However, some reddit users report being able to use [16](https://libreddit.dcs0.hu/r/Hardware_for_Linux/comments/scp0p4/newest_desktop_of_the_day_with_bsd_biostar/) and even [32 GB](https://libreddit.dcs0.hu/r/homelab/comments/flqcs6/asrock_j4105itx_32gb_success/) of RAM with varying results.

I decided to take a gamble with two sticks of [Corsair Venegance 2400 MHz 8 GB](https://www.corsair.com/us/en/Categories/Products/Memory/VENGEANCE-LPX/p/CMK8GX4M1A2400C16) for a total of 16 GB.

### Storage
Spinning hard-disk drives (HDD) are popular additions to a Home server or NAS due to their high storage capacity and low price.
However, they have reduced speeds and increased power draw compared to solid-state Drives (SSD). Their moving parts also add noise and a point of failure.

I've opted for two [Crucial MX500 SSD's](https://www.crucial.com/products/ssd/crucial-mx500-ssd) (250 GB bootdrive + 2 TB storage drive) as they provide a good balance between price and performance. In addition, they support "Integrated Power Loss Immunity" to prevent data loss during power outages.

--------------------

## Assembly
| Image | Text |
|:---|:---|
| ![inside of the case](https://github.com/Stylback/server-journey/blob/main/media/inside.jpg?raw=true) | The process of assembling the system was relatively painless. The case can be disassembled for easy access to the motherboard fittings and has plenty of room for cable managment without the presence of a GPU. |
| ![inside of the case](https://github.com/Stylback/server-journey/blob/main/media/cable_orientation.jpg?raw=true) | The only gripe I had with the case was the power extender, it is aligned in such a way that the cable has to be forcefully twisted to slot into the PSU. This could have been easily amended by allowing the screwed-in end of the extender to be aligned in the opposite direction, allowing easy cable management no matter the PSU. |
| ![inside of the case](https://github.com/Stylback/server-journey/blob/main/media/back.jpg?raw=true) | Rear-view and IO. |
| ![inside of the case](https://github.com/Stylback/server-journey/blob/main/media/outside.jpg?raw=true) | Assembled system. |

--------------------

## Approximating power draw

| Component | Power draw (_idle_) [W] | Power draw (_active_) [W] |
| :--- | ---: | ---: |
| [Crucial MX500 1 TB](https://www.anandtech.com/show/12263/the-crucial-mx500-500gb-review/8) | 0.10 | 0.54 |
| [Crucial MX500 250 GB](https://www.anandtech.com/show/12263/the-crucial-mx500-500gb-review/8) | 0.08[^1] | 0.54[^1] |
| [Corsair Venegance 8 GB x2](https://www.tomshardware.com/reviews/intel-core-i7-5960x-haswell-e-cpu,3918-13.html) | 6.00[^2] | 6.00[^2] |
| [Biostar J4105NHU](https://uni.hi.is/helmut/2021/06/07/power-consumption-of-raspberry-pi-4-versus-intel-j4105-system/) | 0.70[^3] | 9.00[^3] |
| __Total:__ | 6.88 | 16.08 |
| __Total (_70% efficiency_[^4]):__ | __9.82__ | __22.97__ |

If we assume an average of 2 hours of full system utilization per day, with the rest being equivalent to an idle power state, we can approximate the daily power consumption to:

`(22.97*2 + 9.82*22)/1000 = 0.262 KWh/Day`

Or a yearly power consumption of:
`0.262*365= 95.6 KWh/Year`

[^1]: Infered from the 500 GB model.

[^2]: Which seems to agree with Crucials [own assessment](https://www.crucial.com/support/articles-faq-memory/how-much-power-does-memory-use).

[^3]: Infered by subtracting 3 W from authors measurements.

[^4]: Inferred from a 22.5 W test of Be quiet! Pure Power L8 300 W [measurement](https://web.archive.org/web/20131024051217/http://uk.hardware.info/reviews/4683/3/45-psus-tested-at-very-low-loads-which-one-is-the-most-efficient-225-watt-test).

## Software

### Services

#### High priority (_Services I need to provide core functionality_)

| Service name | Service type | Note |
| :--- | :--- | :--- |
| [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server) | Operating System |  |
| [Docker](https://www.docker.com/) | Application container |  |
| [NGINX manager](https://nginxproxymanager.com/) | Reverse-proxy manager with SSL | Will be using in conjunction with a domain name |
| [Nextcloud](https://nextcloud.com/) | Cloud storage, file sync and more |  |
| [Jellyfin](https://jellyfin.org/) | Media streaming |  |

#### Low priority (_Services I might implement if there is enough headroom_)

| Service name | Service type | Note |
| :--- | :--- | :--- |
| [Uptime Kuma](https://github.com/louislam/uptime-kuma) | Uptime monitor | Has both a Docker image and proxy support |
| [Static Web Server](https://sws.joseluisq.net/) | Static website server | Looks promising, will do more research before commiting. |
| [Kopia](https://kopia.io/) | Backup solution | Looks good! Perhaps use it to schedule regular backups? |
| [Standard Notes](https://standardnotes.com/) | End-to-End encrypted notes | Can be self hosted via Docker |

## Security

### Data redundancy

### Unauthorized remote access

**[Back to the top](#)**

--------------------
## Text templates in Markdown format

`This is a code box`

> This is a caption



| Col 1 | Col 2 | Col 3 | Col 4 |
| --- | :---: | ---: | :--- |
| Normal| Centered | right-aligned | left-aligned |
| []() |  |  |

--------------------