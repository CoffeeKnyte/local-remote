#bin/bash
set -x
mkdir -p /mnt/unionfs

sudo systemctl disable mergerfs.service
sudo systemctl stop mergerfs.service

sudo systemctl disable zenstorage.service
sudo systemctl stop zenstorage.service
#sudo systemctl disable zenstorage_primer.service
#sudo systemctl stop zenstorage_primer.service
#sudo systemctl disable zenstorage_primer.timer
#sudo systemctl stop zenstorage_primer.timer

#sudo systemctl disable zenremote.service
#sudo systemctl stop zenremote.service
#sudo systemctl disable zenremote_primer.service
#sudo systemctl stop zenremote_primer.service
#sudo systemctl disable zenremote_primer.timer
#sudo systemctl stop zenremote_primer.timer

#sudo rm /etc/systemd/system/zenremote.service
#sudo rm /etc/systemd/system/zenremote_primer.service
#sudo rm /etc/systemd/system/zenremote_primer.timer
sudo rm /etc/systemd/system/zenstorage.service
#sudo rm /etc/systemd/system/zenstorage_primer.service
#sudo rm /etc/systemd/system/zenstorage_primer.timer
sudo rm /etc/systemd/system/mergerfs.service

sudo rm /etc/systemd/system/zenunion.service
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenunion.service -P /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable zenunion.service && sudo systemctl restart zenunion.service
sleep 1
#restart all dockers
docker restart $(docker ps -q)
