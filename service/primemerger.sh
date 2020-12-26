#!/bin/bash
# This pre-primes the ZenDRIVE Union for instant startup of Plex
find /mnt/zenstorage/zd-anime  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-audiobooks  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-courses  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-movies  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-movies-non-english  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-sports  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-tv1  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-tv2  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-tv3  -type d -maxdepth 3 &
find /mnt/zenstorage/zd-tv-non-english  -type d -maxdepth 3 &
# we need to wait till it's all done before we hand back control
wait
