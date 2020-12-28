#bin/bash

mkdir -p /mnt/zenstorage
mkdir -p /opt/scripts/zenlocal
sudo touch /var/log/rclone-zenstorage.log
sudo touch /var/log/rclone-inbound.log
sudo chown seed:seed /var/log/rclone-*.log

sudo systemctl disable mergerfs.service
sudo systemctl stop mergerfs.service

sudo systemctl disable zenstorage.service
sudo systemctl stop zenstorage.service
sudo rm /etc/systemd/system/zenstorage.service
sudo rm /etc/systemd/system/mergerfs.service
sudo rm /opt/scripts/zenlocal/primemerger.sh

sudo umount /mnt/zenstorage
sudo umount /mnt/inbound

sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenstorage.service -P /etc/systemd/system/
#sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/inbound.service -P /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/mergerfs.service -P /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/primemerger.sh -P /opt/scripts/zenlocal/
sudo chmod +x /opt/scripts/zenlocal/primemerger.sh
sudo chown seed:seed /opt/scripts/zenlocal/primemerger.sh

sudo systemctl daemon-reload
sleep 1
sudo systemctl enable zenstorage.service && sudo systemctl restart zenstorage.service
echo "Finished priming"
#sudo systemctl enable inbound.service && sudo systemctl restart inbound.service
sudo systemctl enable mergerfs.service && sudo systemctl restart mergerfs.service 
sleep 1
#restart all dockers
docker restart $(docker ps -q)
