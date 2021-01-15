#!/bin/bash
# This pre-primes the ZenDRIVE mergerfs for instant startup of Plex
find /mnt/zenstorage/zd-anime  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-audiobooks  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-courses  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-movies  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-movies-non-english/movies-non-english/Bollywood  -type d -maxdepth 1 &
find /mnt/zenstorage/zd-sports  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-tv1  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-tv2  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-tv3  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-tv-non-english/tv_non-english/asian  -type d -maxdepth 1 &
find /mnt/zenstorage/zd-inbound/inbound/coffee  -type d -maxdepth 1 &
# we need to wait till it's all done before we hand back control
wait
