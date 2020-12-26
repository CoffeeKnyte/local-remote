#bin/bash

mkdir -p /mnt/zenstorage
mkdir -p /opt/scripts/zenlocal
sudo touch /var/log/rclone-zenstorage.log
sudo chown seed:seed /var/log/rclone-zenstorage.log

sudo systemctl disable mergerfs.service
sudo systemctl stop mergerfs.service

sudo systemctl disable zenstorage.service
sudo systemctl stop zenstorage.service
sudo systemctl disable zenstorage_primer.service
sudo systemctl stop zenstorage_primer.service
sudo systemctl disable zenstorage_primer.timer
sudo systemctl stop zenstorage_primer.timer

sudo systemctl disable zenremote.service
sudo systemctl stop zenremote.service
sudo systemctl disable zenremote_primer.service
sudo systemctl stop zenremote_primer.service
sudo systemctl disable zenremote_primer.timer
sudo systemctl stop zenremote_primer.timer

sudo systemctl disable zenunion.service
sudo systemctl stop zenunion.service
sudo rm /etc/systemd/system/zenunion.service
sudo rm /etc/systemd/system/zenremote.service
sudo rm /etc/systemd/system/zenremote_primer.service
sudo rm /etc/systemd/system/zenremote_primer.timer
sudo rm /etc/systemd/system/zenstorage.service
sudo rm /etc/systemd/system/zenstorage_primer.service
sudo rm /etc/systemd/system/zenstorage_primer.timer
sudo rm /etc/systemd/system/mergerfs.service

sudo umount /mnt/zenstorage

sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenstorage.service -P /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/mergerfs.service -P /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/primemerger.sh -P /opt/scripts/zenlocal/
sudo chmod +x /opt/scripts/zenlocal/primemerger.sh
sudo chown seed:seed /opt/scripts/zenlocal/primemerger.sh

sudo systemctl daemon-reload
sleep 1
sudo systemctl enable zenstorage.service && sudo systemctl restart zenstorage.service
echo "Finished priming"
sudo systemctl enable mergerfs.service && sudo systemctl restart mergerfs.service 
sleep 1
#restart all dockers
docker restart $(docker ps -q)
